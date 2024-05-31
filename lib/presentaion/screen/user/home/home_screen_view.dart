import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
 final _key=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        body: Center(
          child: Container(
            child: IconButton(
                  onPressed: () {
                    final authBloc = BlocProvider.of<LoginauthBloc>(context);
                    authBloc.add(SignOutEvent());
              
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                  },
                  icon: Icon(Icons.logout)) ,
          ),
        ),
        
      
                    
      ),
    );
  }
}
