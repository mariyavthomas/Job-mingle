import 'package:flutter/widgets.dart';

import 'package:jobmingle/presentaion/screen/common/onboarding/onboarding.dart';
import 'package:jobmingle/presentaion/screen/common/splash/splash_view_screen.dart';
import 'package:jobmingle/presentaion/screen/company/Home/ComanyHome.dart';
import 'package:jobmingle/presentaion/screen/company/auth_company/com_login_screen.dart';
import 'package:jobmingle/presentaion/screen/company/register/screen/sign_company.dart';
import 'package:jobmingle/presentaion/screen/user/home/home_screen_view.dart';
import 'package:jobmingle/presentaion/screen/user/login/login_view_screen.dart';
import 'package:jobmingle/presentaion/screen/user/register/user_register_view.dart';

class Routers{
    Map<String,Widget Function(BuildContext )> routes= {
          '/': (context) => SplashPage(),
          '/onboarding':(context) => Onboarding(select: false,),
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/Lcomp': (context) => LoginPageCompany(),
         '/Scomp': (context) => RegisterPageCompany(),
          '/CompanyHome':(context)=>CompanyHomeScreen()
          
        };
}
