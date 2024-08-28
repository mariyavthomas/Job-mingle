import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';
import 'package:jobmingle/presentaion/screen/common/onboarding/onboarding.dart';

import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginauthBloc, LoginauthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/BottamNavigation', (route) => false);
            } else if (state is UnAuthenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Onboarding()),
              );
            }
          },
        ),
      ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
