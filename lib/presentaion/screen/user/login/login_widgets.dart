import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/login_auth/loginauth_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/login/forgot_password.dart';
import 'package:jobmingle/presentaion/screen/user/register/widgets/button_widgets/buttonwithgooge_widgets.dart';
import 'package:jobmingle/utils/cutomtextformfil.dart';
import 'package:lottie/lottie.dart';

class logincolum extends StatelessWidget {
  const logincolum({
    super.key,
    required this.loading,
    required TextEditingController emailController,
    required TextEditingController passwordcontroller,
  })  : _emailController = emailController,
        _passwordcontroller = passwordcontroller;

  final TextEditingController _emailController;
  final TextEditingController _passwordcontroller;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        child: Lottie.asset('lib/assests/images/splash.json',
            height: 120, width: 120),
      ),
      Text('Log in to JobMingles',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      SizedBox(
        height: 20,
      ),
      CustomTextFormField(
          labeltext: 'Email ID',
          controller: _emailController,
          hintText: "Enter the Email"),
      SizedBox(
        height: 20,
      ),
      CustomTextFormField(
          labeltext: 'Password',
          obscureText: true,
          controller: _passwordcontroller,
          hintText: "Enter the Password"),
      SizedBox(height: 5),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgotpassword()));
              },
                child: Text(
              'Forgot Password?',
              style: TextStyle(color: Color.fromARGB(255, 7, 42, 167)),
            ))),
      ),
      SizedBox(
        height: 5,
      ),
      // loading
      //     ? CircularProgressIndicator()
      //     : 
          InkResponse(
              onTap: () {
                // Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                BlocProvider.of<LoginauthBloc>(context).add(LoginEvent(
                    email: _emailController.text.trim(),
                    password: _passwordcontroller.text.trim()));
              },
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(200, 75, 110, 225),
                ),
                child: Center(
                  child: Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
            ),

      SizedBox(
        height: 10,
      ),
      Text('or'),
      Divider(
        color: Colors.black,
        thickness: 1,
      ),
      SizedBox(
        height: 10,
      ),
      buttongoogle_widget(),
       SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('New here?'),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Register now'))
        ],
      )
    ]);
  }
}
