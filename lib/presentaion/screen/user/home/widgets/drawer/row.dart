import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';

class CutomRow extends StatefulWidget {
  final Icon customicon;
  final VoidCallback onPressed;
  final String text;

  CutomRow({
    super.key,
    required this.customicon,
    required this.onPressed,
    required this.text,
  });

  @override
  State<CutomRow> createState() => _CutomRowState();
}

class _CutomRowState extends State<CutomRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.customicon,
        TextButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
  // ignore: unused_element
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

  