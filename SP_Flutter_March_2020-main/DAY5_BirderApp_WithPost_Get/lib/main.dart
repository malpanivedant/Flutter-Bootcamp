import 'package:birderapp/provider/bird_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// alphabetically
import 'models/bird_category_model.dart';
import './widgets/bird_category_grid_screen.dart';

// import 'widgets/bird_list_using_card_listview.dart';

// models
// import './models/bird_model.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // do not call widgets(runApp) before firebase initializes
  runApp(BirdApp());
}

class BirdApp extends StatelessWidget {
  final List<BirdCategoryModel> _birdCategories = [
    BirdCategoryModel(
        name: 'All Birds',
        id: 1,
        imageUrl:
            'https://images.vexels.com/media/users/3/189921/isolated/preview/b1a526c86ebc75b00e99b0ee5dcf133f-standing-pigeons-silhouette-by-vexels.png'),
    BirdCategoryModel(
        name: 'Waders',
        id: 2,
        imageUrl:
            'https://images.vexels.com/media/users/3/189725/isolated/preview/64dc0d9525f8fae057b4c345a7231270-flying-pigeon-silhouette-by-vexels.png'),
    BirdCategoryModel(
        name: 'Perching Birds',
        id: 3,
        imageUrl:
            'https://images.vexels.com/media/users/3/189725/isolated/preview/64dc0d9525f8fae057b4c345a7231270-flying-pigeon-silhouette-by-vexels.png'),
    BirdCategoryModel(
        name: 'Tree-clinging Birds',
        id: 4,
        imageUrl:
            'https://cdn11.bigcommerce.com/s-xj69ljw63/images/stencil/266x266/v/bird-woodpecker-control-266x266__19563.original.png'),
    BirdCategoryModel(
        name: 'Seabirds',
        id: 5,
        imageUrl:
            'https://www.pngkey.com/png/full/286-2863867_white-bird-black-background.png'),
    BirdCategoryModel(
        name: 'Birds Of Prey',
        id: 6,
        imageUrl:
            'https://webcomicms.net/sites/default/files/clipart/168765/white-eagle-cliparts-168765-3390204.png'),
    BirdCategoryModel(
        name: 'Flighless Birds',
        id: 7,
        imageUrl:
            'https://images.vexels.com/media/users/3/189725/isolated/preview/64dc0d9525f8fae057b4c345a7231270-flying-pigeon-silhouette-by-vexels.png'),
    BirdCategoryModel(
        name: 'Pet Birds',
        id: 8,
        imageUrl:
            'https://cdn11.bigcommerce.com/s-xj69ljw63/images/stencil/266x266/v/bird-woodpecker-control-266x266__19563.original.png')
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final String appTitle = 'Birder\'s App';

    return ChangeNotifierProvider(
      create: (context) => BirdListProvider(),
      child: MaterialApp(
        title: 'Birder App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('$appTitle'),
            centerTitle: true,
          ),
          // body: BirdListWidget(),
          body: BirdsCategoryScreen(
            listofcategories: _birdCategories,
          ),
        ),
      ),
    );
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
