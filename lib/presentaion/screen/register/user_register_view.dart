import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/login_auth/loginauth_bloc.dart';
import 'package:jobmingle/presentaion/screen/home/home_screen_view.dart';
import 'widgets/colum_widgets.dart/register_colum_widgets.dart';

// class RegisterPageWrapper extends StatelessWidget {
//   const RegisterPageWrapper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LoginauthBloc(),
//       child: RegisterPage(),
//     );
//   }
// }

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _fullnamecontroller = TextEditingController();
  TextEditingController _phonenumbercontroller = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return
        // BlocListener<GoogleAthBloc, GoogleAthState>(
        //   listener: (context, state) {
        //     if (state is GoogleAthSuccess) {
        //       WidgetsBinding.instance.addPostFrameCallback((_) {
        //         Navigator.pushAndRemoveUntil(
        //             context,
        //             MaterialPageRoute(builder: (context) => HomePage()),
        //             (route) => false);
        //       });
        //     }
        //   },
        //   child:
        BlocBuilder<LoginauthBloc, LoginauthState>(builder: (context, state) {
      if (state is LoginauthInitialstate) {
        loading = false;
      }
      if (state is Authloading) {
        loading = true;
      }
      if (state is AuthenticatedError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.message),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        BlocProvider.of<LoginauthBloc>(context)
                            .add(LogingInitialEvent());
                      },
                      child: Text('ok'))
                ],
              );
            },
          );
        });
      }

      if (state is Authenticated) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Successfully Registered'),
            backgroundColor: Colors.green,
          ));
        });
        Future.delayed(Duration(seconds: 2),(){
          Navigator.pushNamedAndRemoveUntil(
            context, '/onboarding', (route) => false);
        });
        
      }
      return Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: registercolum(
                      loading: loading,
                      fullnamecontroller: _fullnamecontroller,
                      emailController: _emailController,
                      passwordcontroller: _passwordcontroller,
                      phonenumbercontroller: _phonenumbercontroller),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
