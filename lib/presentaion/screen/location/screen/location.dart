// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// import 'package:jobmingle/presentaion/screen/user/home/home_screen_view.dart';
// import 'package:permission_handler/permission_handler.dart';

// class Location extends StatefulWidget {
//   const Location({super.key});
 
//   @override
//   State<Location> createState() => _LocationState();
// }


// class _LocationState extends State<Location> {
//   String ? currentaddress;
//   bool ? isLocpermitted;
//   final locationPermission = Permission.location;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: 400,
//           width: MediaQuery.sizeOf(context).width -100,
//           child: Column(
//             children: [
//               Container(
//                 child: Image.asset("lib/assests/images/location.png"),
//                 height: 300,
//                 width: MediaQuery.sizeOf(context).width -100,
//               ),
//               GestureDetector(
//                 onTap: (){},
//                 child:Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100
//                     ),
//                     color: Colors.blue
//                   ),
//                   height: 50,
//                   width: MediaQuery.sizeOf(context).width -200,
//                 child: Center(
//                   child: Text('Enable Location',
//                   style: TextStyle(
//                     color: Colors.white,fontWeight: FontWeight.bold
//                   ),),
//                 ),
//                 ) ,
//               ),
//               GestureDetector(
//                 onTap: (){
//                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
//                 },
//                 child: Text("Not Now",style: TextStyle(
//                   color: Colors.grey
//                 ),),
//               )
//             ],
//           ),
//         ),
//       ),
//     );

//   }
//   Future<void>checkPermission(Permission permission, context)async{
//     final status = await permission.request();
//     if(status.isGranted){
//       isLocpermitted =true;
//       final position= await Geolocator.getCurrentPosition();

//       await getAddresslatLong(position.latitude,position.longitude);
//     }
//     else{
//       isLocpermitted =false;
//       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
//     }
 
//   }

//   getAddresslatLong(double lat, double long) async {
//     await placemarkFromCoordinates(lat, long).then((List<Placemark> placemark) {
//       Placemark place = placemark[0];

//       setState(() {});
//       currentaddress = place.locality;
//     });

//     Map<String, dynamic> location = {
//       "location": currentaddress,
//       "location-status": true
//     };

//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc()
//         .update(location)
//         .then((value) => Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//               builder: (context) => HomePage(),
//             ),
//             (route) => false));
//   }
// }