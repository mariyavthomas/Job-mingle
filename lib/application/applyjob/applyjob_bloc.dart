import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'applyjob_event.dart';
part 'applyjob_state.dart';

class ApplyjobBloc extends Bloc<ApplyjobEvent, ApplyjobState> {
  ApplyjobBloc() : super(ApplyjobInitial()) {
    on<ApplyjobEvent>((event, emit) {
      
    });
  }
}
