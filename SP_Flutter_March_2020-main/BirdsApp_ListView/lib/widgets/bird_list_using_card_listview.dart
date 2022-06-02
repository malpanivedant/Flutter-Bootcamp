import '../models/bird_model.dart';
import 'package:flutter/material.dart';

class BirdListWidget extends StatelessWidget {
  final List<BirdModel> _listOfBirds;
  BirdListWidget(this._listOfBirds);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ..._listOfBirds.map(
          (eachBird) => Card(
            elevation: 10,
            child: ListTile(
              leading: Image(
                  image: NetworkImage(eachBird.imageUrl),
                  width: 100,
                  fit: BoxFit.fitWidth),
              title: Text(
                eachBird.name,
                style: TextStyle(fontSize: 25.0, fontFamily: 'Raleway'),
              ),
              subtitle: Text(
                eachBird.scientificName,
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(Icons.delete),
            ),
          ),
        )
      ],
    );
  }
}
