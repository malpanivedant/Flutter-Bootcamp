// Column(
//           children: <Widget>[
//             ..._listOfBirds.map(
//               (eachBird) => Container(
//                 margin: EdgeInsets.all(5),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                       width: 100.00,
//                       child: Image(
//                           // image: AssetImage(eachBird.imageUrl),
//                           image: NetworkImage(eachBird.imageUrl)),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             eachBird.name,
//                             style: TextStyle(
//                               fontSize: 30.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             eachBird.scientificName,
//                             style: TextStyle(
//                               fontSize: 20.0,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),