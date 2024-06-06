part of 'update_pic_bloc.dart';

sealed class UpdatePicState extends Equatable {
  const UpdatePicState();
  
  @override
  List<Object> get props => [];
}

final class UpdatePicInitial extends UpdatePicState {}
class UploadPictureFailure extends UpdatePicState{}
class UploadPictureLoading extends UpdatePicState{
  
}
class UploadPictureSuccess  extends UpdatePicState{
  final String userimage;
  UploadPictureSuccess(this.userimage);
   @override
  List<Object> get props => [userimage];
}