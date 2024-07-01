part of 'pdfdownload_bloc.dart';

sealed class PdfdownloadState extends Equatable {
  const PdfdownloadState();
  
  @override
  List<Object> get props => [];
}

final class ResumedownloadInitial extends PdfdownloadState {}
class Uloadloading extends PdfdownloadState{}
 class Resumeuploadsuccess extends PdfdownloadState{
   final String downloadUrl;
   String filename;
   final DateTime uploadDate;
  Resumeuploadsuccess({
    required this.uploadDate, 
    required this.downloadUrl,required this.filename});
  @override
  List<Object> get props => [downloadUrl, filename, uploadDate];

 }
 class Resumeuploadfailer extends PdfdownloadState{
  String error;
  Resumeuploadfailer({required this.error});
 }
