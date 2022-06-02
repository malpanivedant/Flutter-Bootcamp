import 'package:birderapp/models/bird_model.dart';
import 'package:flutter/material.dart';

class BirdDetails extends StatelessWidget {
  final BirdModel theBird;

  BirdDetails({@required this.theBird});

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
                tag: 'birdFly-${theBird.id}',
                child: Image.network(theBird.imageUrl,
                    height: 300, fit: BoxFit.cover),
              ),
              ListTile(
                title: Text(theBird.name, style: TextStyle(fontSize: 40)),
                subtitle: Text(theBird.scientificName,
                    style: TextStyle(fontSize: 25)),
                trailing: Icon(Icons.favorite_border),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(theBird.info,
                    style: TextStyle(color: Colors.grey[600], height: 1.8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
