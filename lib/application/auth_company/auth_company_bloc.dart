import 'package:bloc/bloc.dart';
import 'package:jobmingle/domin/models/company_model.dart';
import 'package:meta/meta.dart';

part 'auth_company_event.dart';
part 'auth_company_state.dart';

class AuthCompanyBloc extends Bloc<AuthCompanyEvent, AuthCompanyState> {
  AuthCompanyBloc() : super(AuthCompanyInitial()) {
    on<AuthCompanyEvent>((event, emit) {
  
    });
  }
}
