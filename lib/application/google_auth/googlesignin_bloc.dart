import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'googlesignin_event.dart';
part 'googlesignin_state.dart';

class GooglesigninBloc extends Bloc<GooglesigninEvent, GooglesigninState> {
  GooglesigninBloc() : super(GooglesigninInitial()) {
    on<GooglesigninEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}


// import 'package:bloc/bloc.dart';
// import 'package:jobmingle/application/bloc/googleauth/google_ath_state.dart';
// import 'package:jobmingle/infrastructure/repository/googleloginrepo.dart';
// import 'package:meta/meta.dart';

// part 'google_ath_event.dart';
// part 'google_ath_state.dart';

// class GoogleAthBloc extends Bloc<GoogleAthEvent, GoogleAthState> {
//   GoogleAthBloc(this._authRepo) : super(GoogleAthInitial()) {
//     on<SigninEventwithgoogle>(_signinwithgoogle);
//   }
//   final AuthRepo _authRepo;
//   Future<void>_signinwithgoogle(SigninEventwithgoogle event,Emitter<GoogleAthState>emit) async{
  
//   emit(GoogleAthPending());
//   //await  Future.delayed(Duration(seconds: 2));
//   final user=  await _authRepo.Signinwithgoogle();
//    if(user ==null){
//     return emit(GoogleAthError());
//    }

//   emit(GoogleAthSuccess());
//   }
// }
