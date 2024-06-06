part of 'update_pic_bloc.dart';

sealed class UpdatePicEvent extends Equatable {
  const UpdatePicEvent();

  @override
  List<Object> get props => [];
}
class UploadPicture extends UpdatePicEvent{
  final String file;
  final String userid;
  UploadPicture(this.file,this.userid);
  @override
  List<Object> get props => [file,userid];
}
