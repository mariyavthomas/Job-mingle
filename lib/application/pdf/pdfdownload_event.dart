part of 'pdfdownload_bloc.dart';

sealed class PdfdownloadEvent extends Equatable {
  const PdfdownloadEvent();

  @override
  List<Object> get props => [];
}
class UploadResume extends PdfdownloadEvent{
  final File file;
  final String uid;
  final String filename;
  UploadResume({required this.file,required this.filename,required this.uid});
}
