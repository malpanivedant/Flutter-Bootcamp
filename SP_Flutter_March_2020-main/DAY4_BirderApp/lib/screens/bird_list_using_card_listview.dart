// flutter packages
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

// screens
import '../screens/bird_details_screen.dart';
import '../screens/add_new_bird.dart';

// models
import '../models/bird_list_model_change_notifier.dart';
// import '../models/bird_model.dart';

class BirdListWidget extends StatelessWidget {
  BirdListWidget();

  void navigateToAddNewBirdScreen(BuildContext context) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewBirdWidget(),
      ),
    );
    // dependent code !
    if (result == "success") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          'Bird added successfully!',
        )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BirdListChangeNotifier>(
      builder: (_, birdlistCNInstance, __) => Scaffold(
        appBar: AppBar(
          title: Text('List of Birds'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            ...birdlistCNInstance.listOfBirds.map(
              (eachBird) => GestureDetector(
                onHorizontalDragEnd: (_) {
                  birdlistCNInstance.deleteABird(eachBird.id);
                },
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    leading: Hero(
                      tag: 'birdFly-${eachBird.id}',
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BirdDetails(
                                theBird: eachBird,
                              ),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.teal,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(eachBird.imageUrl),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      eachBird.name,
                      style: TextStyle(fontSize: 25.0, fontFamily: 'Raleway'),
                    ),
                    subtitle: Text(
                      eachBird.scientificName,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    trailing: Theme(
                      data: ThemeData(splashColor: Colors.red[200]),
                      child: Material(
                        elevation: 0,
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                          onTap: () {
                            // print('U Tapped ! But have u tapped ur potential ?');
                            birdlistCNInstance.deleteABird(eachBird.id);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
            ),
            onPressed: () {
              navigateToAddNewBirdScreen(context);
            }),
      ),
    );
  }
}

// Image(
//                     image: NetworkImage(eachBird.imageUrl),
//                     width: 100,
//                     fit: BoxFit.fitWidth),
