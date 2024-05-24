import 'package:flutter/material.dart';
import 'package:jobmingle/infrastructure/helper_class/userrep/googleloginrepo.dart';

class GoogleButton extends StatelessWidget {
  GoogleButton({
    super.key,
  });
 //AuthRepoGoogle google=AuthRepoGoogle();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
        // AuthRepoGoogle().signInWithGoogle(context,true);
      AuthRepoGoogle().showBottomAlertBox(context);
        
        },
        child: Container(
          height: 50,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:Colors.black,
          ),
          child: Center(
            child: Row(children: [
              SizedBox(
                width: 40,
              ),
              SizedBox(
                width: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircleAvatar(
                  minRadius: 20,
                  backgroundImage:
                      AssetImage('lib/assests/images/downloadgoogleicon.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Sign In with Google',
                  style: Theme.of(context).textTheme.displayLarge,
                  
                ),
                //  CircularProgressIndicator()
              ]),
            ]),
          ),
        ));
  }
}
