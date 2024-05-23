import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/login_auth/loginauth_bloc.dart';
import 'package:jobmingle/presentaion/screen/common/naviagating_screen/navigating_screen.dart';
import 'package:jobmingle/presentaion/screen/user/home/home_screen_view.dart';
import 'package:jobmingle/presentaion/screen/user/onboarding/onboarding.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginauthBloc, LoginauthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else if (state is UnAuthenticated) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => NaviagtingScreen()));
        }
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child:
                    Lottie.asset('lib/assests/images/splash.json', height: 200),
              )
            ],
          ),
        ),
      ),
    );
  }
}
