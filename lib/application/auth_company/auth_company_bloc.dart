import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';
import 'package:jobmingle/domin/models/company_model.dart';
import 'package:meta/meta.dart';

part 'auth_company_event.dart';
part 'auth_company_state.dart';

class AuthCompanyBloc extends Bloc<AuthCompanyEvent, AuthCompanyState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCompanyBloc() : super(AuthCompanyInitial()) {
    on<LogingInitialcompanyEvent>((event, emit) {
      //Hanfle LoginInitialEvent//

      emit(AuthCompanyInitial());
    });
     // --------->Checking user is signin or not<----------------//

     on<CheckLoginStatusEventCompany>((event, emit) async {
      User? user;
      try {
        await Future.delayed(Duration(seconds: 3), () {
          user = _auth.currentUser;
        });
        if (user != null) {
          emit(Authenticatedcompany(user: user));
        } else {
          emit(UnAuthenticatedcompany());
        }
      } catch (e) {
        emit(AuthenticatedErrorcomapny(message: e.toString()));
      }
    });

    //------------------------->Sign up<-----------------------------//

    on<SignUpCompany>((event, emit) async {
      emit((AuthCompanyLoading()));
      try {
        final userCredential = await _auth.createUserWithEmailAndPassword(
            email: event.company.companyemail.toString(),
            password: event.company.companypassword.toString());

        final user = userCredential.user;
        if (user != null) {
          FirebaseFirestore.instance.collection('company').doc(user.uid).set({
            'email': user.email,
            'password': event.company.companypassword,
            'companyname': event.company.companyname,
            'phone': event.company.phone,
            
          'uid': user.uid,
            'CreatedAt': DateTime.now()
          });
          emit(Authenticatedcompany(user:user));
        } else {
          emit(UnAuthenticatedcompany());
        }
      } catch (e) {
        emit(AuthenticatedErrorcomapny(message: e.toString()));
      }
    });
    
    //------------>SignOut<--------------//
     
     on<SignOutCompany>((event, emit) async {
      try {
        await _auth.signOut();
        emit(UnAuthenticatedcompany());
      } catch (e) {
        emit(AuthenticatedErrorcomapny(message: e.toString()));
      }
    });

    //---------->Login<--------------//

    on<LoginComapanyEvent>((event, emit) async {
      emit(AuthCompanyLoading());
      try {
        UserCredential? userCredential = await _auth.signInWithEmailAndPassword(
            email: event.username, password: event.password);
        final user = userCredential.user;
        if (user != null) {
          emit(Authenticatedcompany(user: user));
        } else {
          emit(UnAuthenticatedcompany());
        }
      } on FirebaseAuthException catch (e) {
        emit(AuthenticatedErrorcomapny(message: e.toString()));
      }
    });
    //------ObsecureText---------//

  on<ObsecuretextcompanyEvent>((event, emit) async {
      if (event.obscure) {
        emit(ObsecurecompanyState(obscure: false));
      } else {
        emit(ObsecurecompanyState(obscure: true));
      }
    }); 
 

  }
}
