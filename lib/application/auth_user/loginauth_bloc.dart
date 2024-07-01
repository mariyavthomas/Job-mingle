import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:meta/meta.dart';

part 'loginauth_event.dart';
part 'loginauth_state.dart';

class LoginauthBloc extends Bloc<LoginauthEvent, LoginauthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
   String ? imageurl="https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fvectors%2Fblank-profile-picture-mystery-man-973460%2F&psig=AOvVaw0B6FsRF9gDGW8njle5S92J&ust=1717064531634000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCODKh6y8tIYDFQAAAAAdAAAAABAE";

  LoginauthBloc() : super(LoginauthInitialstate()) {
    on<LogingInitialEvent>((event, emit) {
     
      // Handle LoginInitialEvent
     
      emit(LoginauthInitialstate());
    });

    // --------->Checking user is signin or not<----------------//
   
    on<CheckLoginStatusEvent>((event, emit) async {
      User? user;
      try {
        await Future.delayed(Duration(seconds: 3), () {
          user = _auth.currentUser;
        });
        if (user != null) {
          emit(Authenticated(user: user));
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });
   
    //------------------------->Sign up<-----------------------------//
    
    on<SignUpEvent>((event, emit) async {
      emit((Authloading()));
      try {
        final userCredential = await _auth.createUserWithEmailAndPassword(
            email: event.user.email.toString(),
            password: event.user.password.toString());
    
        final user = userCredential.user;
        if (user != null) {
          FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'email': user.email,
            'password': event.user.password,
            'name': event.user.name,
            'phone': event.user.phone,
            'uid': user.uid,
            'pic':imageurl,
            'CreatedAt': DateTime.now(),
            'resume':'',
            'education':'',
            'experence':'',
            'profileheadlines':'',
            'profilesummery':'',
            'course': '',
            'courseStaringyear':'',
            'courseendingyear':'',
            'coursetype':'',
            'higereducation':'',
            'specialization':'',
            'universitynamecollegename':'',
            'grade':'',


            
            
          });
          emit(Authenticated(user: user));
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });

    //------------>SignOut<--------------//
    
    on<SignOutEvent>((event, emit) async {
      try {
        await _auth.signOut();
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });

    //---------->Login<--------------//
    
    on<LoginEvent>((event, emit) async {
      emit(Authloading());
      try {
        UserCredential? userCredential = await _auth.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        final user = userCredential.user;
        if (user != null) {
          emit(Authenticated(user: user));
        } else {
          emit(UnAuthenticated());
        }
      } on FirebaseAuthException catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });
    on<ObsecuretextEvent>((event, emit) async {
      if (event.obscure) {
        emit(ObsecureState(obscure: false));
      } else {
        emit(ObsecureState(obscure: true));
      }
    });
  }
}
