import 'package:flutter/material.dart';

// alphabetically
import 'widgets/bird_list_using_card_listview.dart';

// models
import './models/bird_model.dart';

void main() {
  runApp(BirdApp());
}

class BirdApp extends StatelessWidget {
  final List<BirdModel> _listOfBirds = [
    BirdModel(
        id: 1,
        name: 'Hornbill',
        scientificName: 'Bucerotidae',
        imageUrl:
            'https://zootampa.org/wp-content/uploads/2018/07/main-aviary-great-indian-hornbill-2012.jpg'),
    BirdModel(
        id: 2,
        name: 'Humming Bird',
        scientificName: 'Trochilidae',
        imageUrl:
            'https://www.thespruce.com/thmb/6oqkvxm2kUj6Krf05h7X4qy47fU=/1500x844/smart/filters:no_upscale()/annas-d97a9a5f0321476098e7917726d2366d.jpg'),
    BirdModel(
        id: 3,
        name: 'Sunbird',
        scientificName: 'Nectariniidae',
        imageUrl:
            'https://wildbirdrevolution.org/wp-content/uploads/2019/08/Purple-Sunbird-Photographed-at-Hooghly-Westbengal-Nikon-Photography-by-Soumya-Chakraborty.jpg')
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final String appTitle = 'Birder\'s App';

    return MaterialApp(
        title: 'Birder App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('$appTitle'),
            centerTitle: true,
          ),
          body: BirdListWidget(_listOfBirds),
        ));
  }
}

// Extra Tryouts
// child: Image(
//   image: NetworkImage(
//     'https://upload.wikimedia.org/wikipedia/commons/0/04/Laughing_dove_%28Spilopelia_senegalensis_cambayensis%29.jpg',
//   ),
// ),
//child: Image.asset('assets/images/hornbill.jpg'),
//child: Image.network('https://upload.wikimedia.org/wikipedia/commons/0/04/Laughing_dove_%28Spilopelia_senegalensis_cambayensis%29.jpg'),

// Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   width: 100.00,
//                   child: Image(
//                     image: AssetImage(''),
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       '',
//                       style: TextStyle(
//                         fontSize: 30.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       ' ',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   width: 100.00,
//                   child: Image(
//                     image: AssetImage('assets/images/hummingbird.jpg'),
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       'Humming Bird',
//                       style: TextStyle(
//                         fontSize: 30.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       '',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),

//

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
