// import 'package:flutter/material.dart';
// import 'package:jobmingle/utils/customcolor.dart';

// class JobCard extends StatelessWidget {
//   final String title;
//   final String company;
//   final String location;
//   final String description;

//   JobCard({
//     required this.title,
//     required this.company,
//     required this.location,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       elevation: 3,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               company,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color: Colors.grey[700],
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               location,
//               style: TextStyle(
//                 fontSize: 14.0,
//                 color: Colors.grey[600],
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               description,
//               style: TextStyle(
//                 fontSize: 14.0,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CategoryCard extends StatelessWidget {
//   final IconData icon;
//   final String title;

//   CategoryCard({
//     required this.icon,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       elevation: 3,
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 40, color: CustomColor.bluecolor()),
//             SizedBox(height: 8.0),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
