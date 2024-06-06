import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_pic_event.dart';
part 'update_pic_state.dart';

class UpdatePicBloc extends Bloc<UpdatePicEvent, UpdatePicState> {
  UpdatePicBloc() : super(UpdatePicInitial()) {
    on<UpdatePicEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
