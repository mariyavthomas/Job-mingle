import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobmingle/infrastructure/Repo/resumeRepo.dart';

part 'pdfdownload_event.dart';
part 'pdfdownload_state.dart';

class PdfdownloadBloc extends Bloc<PdfdownloadEvent, PdfdownloadState> {
  UploadResumeRepo uploadResumeRepo;
  PdfdownloadBloc(this.uploadResumeRepo) : super(ResumedownloadInitial()) {
    on<UploadResume>(_uploadresume);
  }

  FutureOr<void> _uploadresume(UploadResume event, Emitter<PdfdownloadState> emit)async {
    emit(Uloadloading());
    try{
     String? pdfUrl = await uploadResumeRepo.uploadResume(event.file,event.filename);
     emit(Resumeuploadsuccess(
      downloadUrl: pdfUrl!,
      filename: event.filename,
      uploadDate: DateTime.now()
      ));
    }catch(e){
        print("Error uploading PDF: $e");
      emit(Resumeuploadfailer(error: e.toString()));
    }
  }
}
