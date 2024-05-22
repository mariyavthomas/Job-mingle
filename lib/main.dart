import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/login_auth/loginauth_bloc.dart';
import 'package:jobmingle/presentaion/screen/home/home_screen_view.dart';
import 'package:jobmingle/presentaion/screen/login/login_view_screen.dart';
import 'package:jobmingle/presentaion/screen/onboarding/onboarding.dart';
import 'package:jobmingle/presentaion/screen/register/user_register_view.dart';
import 'package:jobmingle/presentaion/screen/splash/splash_view_screen.dart';

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
  //  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginauthBloc()..add(CheckLoginStatusEvent()),
        ),
       // BlocProvider(create: (context) => GoogleAthBloc(AuthRepo()))
      ],
      child: MaterialApp(
        theme: ThemeData(
            progressIndicatorTheme:
                ProgressIndicatorThemeData(color: Colors.blue),
            textTheme: TextTheme(
                displayLarge: TextStyle(
                    color: Colors.black,
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
        routes: {
          '/': (context) => SplashPage(),
          '/onboarding':(context) => Onboarding(),
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
        },
      ),
    );
  }
}
