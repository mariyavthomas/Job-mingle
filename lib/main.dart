import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/Update_pic/update_pic_bloc.dart';
import 'package:jobmingle/application/Update_pic/update_pic_event.dart';
import 'package:jobmingle/application/applyjob/applyjob_bloc.dart';

import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';
import 'package:jobmingle/application/get_all_job/get_all_jobs_bloc.dart';
import 'package:jobmingle/application/pdf/pdfdownload_bloc.dart';
import 'package:jobmingle/application/profile/profile_bloc.dart';
import 'package:jobmingle/infrastructure/Repo/alljobrepo.dart';
import 'package:jobmingle/infrastructure/Repo/profile_repo.dart';
import 'package:jobmingle/infrastructure/Repo/resumeRepo.dart';
import 'package:jobmingle/infrastructure/Repo/uploadimgerepo.dart';
import 'package:jobmingle/utils/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyDAv-M0XQW07eQRNLHBn5y7u0u1DRWKYig",
          projectId: "jobmingle-91729",
          messagingSenderId: "547625483270",
          appId: "1:547625483270:android:332ffa444e135d6e0e1787",
          storageBucket: 'jobmingle-91729.appspot.com',
        ))
      : await Firebase.initializeApp();
  // await initializeDependencies();
  runApp(const MyApp());
}
 //final save_key=FirebaseFirestore.instance.collection('user').doc().id;
class MyApp extends StatelessWidget {
  const MyApp({super.key});
   
  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginauthBloc()..add(CheckLoginStatusEvent()),
          
        ),
       
        BlocProvider<ProfileBloc>(create: (context)=>ProfileBloc(UserProfileRepo())..add(GetUserEvent())),
        BlocProvider<UpdatePicBloc>(create: (context)=>UpdatePicBloc(ImageRepo())),
        BlocProvider<GetAllJobsBloc>(create: (context)=>GetAllJobsBloc(AllJobRepo())),
       BlocProvider<PdfdownloadBloc>(create: (context)=>PdfdownloadBloc(UploadResumeRepo())),
       BlocProvider<ApplyjobBloc>(create: (context)=>ApplyjobBloc())

      ],
      child: MaterialApp(
        theme: ThemeData(
            progressIndicatorTheme:
                ProgressIndicatorThemeData(color: Colors.blue),
            textTheme: TextTheme(
                displayLarge: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                bodySmall: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
            appBarTheme:
                AppBarTheme(backgroundColor: Color.fromARGB(200, 75, 110, 225)),
            scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        // go to the splashscreen
        initialRoute: '/',
        routes: Routers().routes,
      ),
    );
  }
}
