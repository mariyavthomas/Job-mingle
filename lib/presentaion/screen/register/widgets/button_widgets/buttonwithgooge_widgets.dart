// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// class buttongoogle_widget extends StatelessWidget {
//   const buttongoogle_widget({
//     super.key,
    
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => context.read<GoogleAthBloc>().add(SigninEventwithgoogle()),
//       child: Container(
//         height: 50,
//         width: 350,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Color.fromARGB(200, 75, 110, 225),
//         ),
//         child: Center(
//           child: Row(children: [
//             SizedBox(
//               width: 40,
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             BlocBuilder<GoogleAthBloc, GoogleAthState>(
//               builder: (context, state) {
//                 if (state is GoogleAthPending) {
//                   return 
//                   Align(
//                     alignment: Alignment.center,
//                     child: CircularProgressIndicator());
//                 }
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       minRadius: 20,
                      
//                       backgroundImage: AssetImage(
//                           'lib/assests/images/downloadgoogleicon.png'),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       'Sign up with Google',
//                       style: Theme.of(context).textTheme.displayLarge,
//                     ),
//                     //  CircularProgressIndicator()
//                   ],
//                 );
//               },
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
