import '../models/bird_model.dart';
import 'package:flutter/material.dart';

class BirdListWidget extends StatelessWidget {
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
            'https://wildbirdrevolution.org/wp-content/uploads/2019/08/Purple-Sunbird-Photographed-at-Hooghly-Westbengal-Nikon-Photography-by-Soumya-Chakraborty.jpg'),
    BirdModel(
        id: 4,
        name: 'Indian Pitta',
        scientificName: 'Pitta brachyura',
        imageUrl:
            'https://i.pinimg.com/736x/4e/e4/e5/4ee4e5e7360d77dbf10f852e5cb40f9e.jpg'),
    BirdModel(
        id: 5,
        name: 'Hooded Pitta',
        scientificName: 'Pitta sordida',
        imageUrl:
            'https://cdn.download.ams.birds.cornell.edu/api/v1/asset/280992861/1800')
  ];
  BirdListWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Birds'),
        centerTitle: true,
      ),
      body: ListView(
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
      ),
    );
  }
}
