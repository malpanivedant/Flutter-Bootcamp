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

  void changeFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      // print(_isFavorite);
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
                trailing: InkWell(
                  onTap: changeFavorite,
                  child: Icon(
                    _isFavorite == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.redAccent[700],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(widget.theBird.info,
                    style: TextStyle(color: Colors.grey[600], height: 2.2)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
