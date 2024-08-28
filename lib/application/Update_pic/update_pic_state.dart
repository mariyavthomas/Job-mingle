import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class UpdatePicState extends Equatable {
   XFile? file;

  UpdatePicState([this.file]);

  UpdatePicState copyWith({XFile? file}) {
    return UpdatePicState(file ?? this.file);
  }

  @override
  List<Object?> get props => [file];
}
// ignore: must_be_immutable
class UpdateLoading extends UpdatePicState{}