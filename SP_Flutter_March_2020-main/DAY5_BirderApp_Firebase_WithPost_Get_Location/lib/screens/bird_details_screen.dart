import 'package:birderapp/models/bird_model.dart';
import 'package:flutter/material.dart';

class BirdDetails extends StatefulWidget {
  final BirdModel theBird;

  BirdDetails({@required this.theBird});

  @override
  _BirdDetailsState createState() => _BirdDetailsState();
}

class _BirdDetailsState extends State<BirdDetails> {
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'birdFly-${widget.theBird.id}',
                child: Image.network(widget.theBird.imageUrl,
                    height: 300, fit: BoxFit.cover),
              ),
              ListTile(
                title:
                    Text(widget.theBird.name, style: TextStyle(fontSize: 40)),
                subtitle: Text(widget.theBird.scientificName,
                    style: TextStyle(fontSize: 25)),
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
                        color: Colors.grey[800], fontSize: 20.0, height: 1.5)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
