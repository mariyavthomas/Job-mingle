import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/home/widgets/drawer/row.dart';
import 'package:jobmingle/presentaion/screen/user/login/forgot_password.dart';
import 'package:jobmingle/presentaion/screen/user/settings/aboutus/screen/about.dart';
import 'package:jobmingle/presentaion/screen/user/settings/jobmingle_works/screen/works.dart';
import 'package:jobmingle/presentaion/screen/user/settings/settings/widgets/customappbar.dart';
import 'package:jobmingle/presentaion/screen/user/settings/settings/widgets/privacy.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(60, 60), child: CustomappBar()),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            CutomRow(
              customicon: Icon(Icons.save),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => JobMingleWorks())),
              text: 'How JobMingle Works',
            ),
            CutomRow(
              customicon: Icon(Icons.report),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen())),
              text: 'About',
            ),
            Privacy(),
            CutomRow(
                customicon: Icon(Icons.password),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Forgotpassword()),
                    ),
                text: 'Change Password'),
            Row(
              children: [
                Text('Sign Out',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Spacer(),
                IconButton(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  icon: Icon(Icons.logout),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _performLogout(context); // Perform the logout
              },
            ),
          ],
        );
      },
    );
  }

  void _performLogout(BuildContext context) {
    final authBloc = BlocProvider.of<LoginauthBloc>(context);
    authBloc.add(SignOutEvent());

    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }


 
}

