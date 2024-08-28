import 'package:flutter/widgets.dart';
import 'package:jobmingle/presentaion/screen/common/onboarding/onboarding.dart';
import 'package:jobmingle/presentaion/screen/common/splash/splash_view_screen.dart';

import 'package:jobmingle/presentaion/screen/user/bottamnaviationbar/bottamscreen/bottan_nav.dart';
import 'package:jobmingle/presentaion/screen/user/home/screen/home_screen_view.dart';
import 'package:jobmingle/presentaion/screen/user/login/login_view_screen.dart';

import 'package:jobmingle/presentaion/screen/user/register/screen/user_register_view.dart';

class Routers{
    Map<String,Widget Function(BuildContext )> routes= {
          '/': (context) => SplashPage(),
          '/onboarding':(context) => Onboarding(),
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
         '/BottamNavigation':(context)=>MyBottom(),
       
          
        };
}
