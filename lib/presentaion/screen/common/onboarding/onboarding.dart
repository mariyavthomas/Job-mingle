import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Onboarding extends StatelessWidget {
  Onboarding({super.key,
 });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                  child: Column(
            children: [
              Container(
                  height: 600,
                  child: Image(
                      image:
                          AssetImage('lib/assests/images/onboaringimage.jpg'))),
              InkWell(
                onTap: () {
                 Navigator.pushNamed(
                        context,  '/register');
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(200, 75, 110, 225),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      Center(
                        child: Text(
                          'Register Account',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      
                     
                    ],
                  )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                 Navigator.pushNamed(
                        context, '/login');
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2,color: Color.fromARGB(200, 75, 110, 225)),
                      
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Row(
                    children: [
                      SizedBox(
                        width: 90,
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:17,
                            fontWeight: FontWeight.bold),
                      ),
                    
                      
                    ],
                  )),
                ),
              )
            ],
                  ),
                ),
          )),
    );
  }
}
