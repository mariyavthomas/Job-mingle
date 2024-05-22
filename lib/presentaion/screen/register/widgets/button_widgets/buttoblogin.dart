import 'package:flutter/material.dart';

class buttonlogin extends StatelessWidget {
  const buttonlogin({

    super.key,
    
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an Account?'),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Login'))
      ],
    );
  }
}
