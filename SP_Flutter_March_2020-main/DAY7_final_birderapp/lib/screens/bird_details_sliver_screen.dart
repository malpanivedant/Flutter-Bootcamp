import 'package:birderapp/models/bird_model.dart';
import 'package:flutter/material.dart';

class BirdDetailsSliverScreen extends StatefulWidget {
  final BirdModel theBird;

  BirdDetailsSliverScreen({@required this.theBird});
  @override
  _BirdDetailsSliverScreenState createState() =>
      _BirdDetailsSliverScreenState();
}

class _BirdDetailsSliverScreenState extends State<BirdDetailsSliverScreen> {
  bool _isFavorite = false;
  int _likes = 100;
  void changeFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void incrementLikes() {
    setState(() {
      _likes += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
              title: Text(
                widget.theBird.name,
                style: TextStyle(fontSize: 25),
              ),
              background: Hero(
                tag: 'birdFly-${widget.theBird.id}',
                child: Image.network(widget.theBird.imageUrl,
                    height: 300, fit: BoxFit.cover),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                ListTile(
                  title:
                      Text('Scientific Name', style: TextStyle(fontSize: 20)),
                  subtitle: Text(widget.theBird.scientificName,
                      style: TextStyle(fontSize: 30)),
                  trailing: Wrap(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            padding: EdgeInsets.all(0.0),
                            splashColor: Colors.blue[300],
                            onPressed: incrementLikes,
                            icon: Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Colors.blueAccent,
                              size: 30,
                            ),
                            color: Colors.redAccent[300],
                          ),
                          Text(
                            _likes.toString(),
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                      IconButton(
                        splashColor: Colors.redAccent[400],
                        onPressed: changeFavorite,
                        icon: Icon(
                          _isFavorite == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 30,
                        ),
                        color: Colors.redAccent[700],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(widget.theBird.info,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 20.0,
                          height: 1.5)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Hero(
//               tag: 'birdFly-${widget.theBird.id}',
//               child: Image.network(widget.theBird.imageUrl,
//                   height: 300, fit: BoxFit.cover),
//             ),
//             ListTile(
//               title: Text(AppLocalizations.of(context).birdName,
//                   style: TextStyle(fontSize: 40)),
//               subtitle: Text(widget.theBird.scientificName,
//                   style: TextStyle(fontSize: 25)),
//               trailing: Wrap(
//                 children: [
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         padding: EdgeInsets.all(0.0),
//                         splashColor: Colors.blue[300],
//                         onPressed: incrementLikes,
//                         icon: Icon(
//                           Icons.thumb_up_alt_outlined,
//                           color: Colors.blueAccent,
//                           size: 30,
//                         ),
//                         color: Colors.redAccent[300],
//                       ),
//                       Text(
//                         _likes.toString(),
//                         style: TextStyle(fontSize: 15.0),
//                       ),
//                     ],
//                   ),
//                   IconButton(
//                     splashColor: Colors.redAccent[400],
//                     onPressed: changeFavorite,
//                     icon: Icon(
//                       _isFavorite == true
//                           ? Icons.favorite
//                           : Icons.favorite_border,
//                       size: 30,
//                     ),
//                     color: Colors.redAccent[700],
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Text(widget.theBird.info,
//                   style: TextStyle(
//                       color: Colors.grey[800], fontSize: 20.0, height: 1.5)),
//             ),
//           ],
//         ),
//       )
