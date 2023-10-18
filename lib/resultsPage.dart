// import 'dart:ui';
// import 'package:flutter/material.dart';

// class DetailPage extends StatelessWidget {
//   const DetailPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             SizedBox(
//               width: double.infinity,
//               child: Image.asset(
//                 'assets/images/fishTwo.jpg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             buttonArrow(),
//             scroll(),
//             fishDetails(),
//           ],
//         )
//       ),
//     );
//   }

//   buttonArrow() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         clipBehavior: Clip.hardEdge,
//         height: 35,
//         width: 35,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(25),
//         ),
//         child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//         child: Container(
//           height: 30,
//           width: 30,
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(25),
//           ),
//           child: IconButton(
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               size: 15,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               //Navigator.pop(context);
//             },
//           ),
//         ),
//       ),
//     ),
//   );
// }

//   fishDetails() {
//   return const Padding(
//     padding: EdgeInsets.all(16.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Row(
//   children: [
//     Text(
//       'Goldfish',
//       style: TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.bold,
//         color: Color.fromARGB(255, 12, 6, 95),
//       ),
//     ),
//     SizedBox(width: 240),
//     Icon(
//       Icons.favorite,
//       color: Colors.blue,
//       ),
//       ],
// ),
//     SizedBox(height: 0.5),
//          Text(
//             'Scientific name:Carassius auratus',
//             style: TextStyle(
//               fontSize: 16,
//               color: Color.fromARGB(255, 12, 6, 95),
//             ),
//           ),
//         SizedBox(height: 5),
//         Text(
//           'Description:',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Color.fromARGB(255, 12, 6, 95),
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           'The goldfish is a popular freshwater fish known for its vibrant colors and unique appearance. It is native to East Asia and is one of the most commonly kept aquarium fish worldwide. Goldfish come in various colors, including orange, red, yellow, and even black. They have a distinctive body shape with a forked tail and prominent dorsal fin.',
//           style: TextStyle(
//             fontSize: 16,
//             color: Color.fromARGB(255, 0, 0, 0),
//           ),
//         ),
//         SizedBox(height: 5),
//         Text(
//           'Behavior:',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Color.fromARGB(255, 12, 6, 95),
//           ),
//         ),
//         SizedBox(height: 5),
//         Text(
//           'Goldfish are known for their peaceful and social behavior. They are omnivorous and feed on a diet that includes fish flakes pellets, and occasionally small aquatic plants. Goldfish are also recognized for their ability to grow in relation to their environment, which can lea to larger sizes when kept in spacious tanks or ponds.They are a popular choice for beginner aquarists due to their hardiness and adaptability to a variety of water conditions.',
//           style: TextStyle(
//             fontSize: 16,
//             color: Color.fromARGB(255, 0, 0, 0),
//           ),
//         ),
//       ],
//     ),
//   );
// }

//   scroll() {
//     return DraggableScrollableSheet(
//        initialChildSize: 0.7,
//        minChildSize: 0.6,
//        maxChildSize: 1.0,
//         builder: (BuildContext context, ScrollController scrollController) {
//           return Container(
//             decoration: const BoxDecoration(
//               color: Color.fromARGB(255, 255, 255, 255),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//             ),
          
//           );
//         }
//        );
//   }
// }