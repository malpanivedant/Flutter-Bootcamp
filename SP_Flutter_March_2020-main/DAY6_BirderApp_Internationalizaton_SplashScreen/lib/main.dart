import 'package:birderapp/provider/bird_list_provider.dart';
import 'package:birderapp/screens/birding_hotspot_screen.dart';
import 'package:birderapp/screens/spash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// alphabetically
import 'models/bird_category_model.dart';
import 'screens/add_new_bird_screen.dart';
import 'screens/bird_category_grid_screen.dart';
import 'screens/bird_list_using_card_listview_screen.dart';

// import 'widgets/bird_list_using_card_listview.dart';

// models
// import './models/bird_model.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // do not call widgets(runApp) before firebase initializes
  runApp(BirdApp());
}

class BirdApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BirdListProvider(),
      child: MaterialApp(
        localizationsDelegates:
            AppLocalizations.localizationsDelegates, // Add this line
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'Birder App',
        theme: ThemeData(
          // fontFamily: 'Raleway', // global fontFamily
          primarySwatch: Colors.teal,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
                headline4: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20.0,
                ),
              ),
        ),
        // home: BirdsCategoryScreen(
        //   listofcategories: _birdCategories,
        // ),
        // initialRoute: '/',
        home: BirdingSplashScreen(),
        routes: {
          BirdsCategoryScreen.routeName: (ctx) => BirdsCategoryScreen(),
          BirdListWidget.routeName: (ctx) => BirdListWidget(),
          BirdingHotSpotScreen.routeName: (ctx) => BirdingHotSpotScreen(),
          AddNewBirdWidget.routeName: (ctx) => AddNewBirdWidget()
        },
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
