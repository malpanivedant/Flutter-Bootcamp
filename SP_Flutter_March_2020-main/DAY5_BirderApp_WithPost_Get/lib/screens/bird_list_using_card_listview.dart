// flutter packages
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

// screens
import '../screens/bird_details_screen.dart';
import '../screens/add_new_bird.dart';

// models
import '../provider/bird_list_provider.dart';
// import '../models/bird_model.dart';

class BirdListWidget extends StatefulWidget {
  BirdListWidget();

  @override
  _BirdListWidgetState createState() => _BirdListWidgetState();
}

class _BirdListWidgetState extends State<BirdListWidget> {
  @override
  void initState() {
    super.initState(); // gets called only once
    Provider.of<BirdListProvider>(context, listen: false).getAllBirds();
  }

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
    return Consumer<BirdListProvider>(
      builder: (_, birdlistCNInstance, __) => Scaffold(
        appBar: AppBar(
          title: Text('List of Birds'),
          centerTitle: true,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    navigateToAddNewBirdScreen(context);
                  },
                  child: Icon(
                    Icons.add,
                    size: 26.0,
                  ),
                ))
          ],
        ),
        body: ListView.builder(
          itemCount: birdlistCNInstance.listOfBirds.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return GestureDetector(
              onHorizontalDragEnd: (_) {
                birdlistCNInstance
                    .deleteABird(birdlistCNInstance.listOfBirds[index].id);
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BirdDetails(
                      theBird: birdlistCNInstance.listOfBirds[index],
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 10,
                // make ListTile a seperate Widget for modularity
                child: ListTile(
                  leading: Hero(
                    tag: 'birdFly-${birdlistCNInstance.listOfBirds[index].id}',
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.teal,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            birdlistCNInstance.listOfBirds[index].imageUrl),
                      ),
                    ),
                  ),
                  title: Text(
                    birdlistCNInstance.listOfBirds[index].name,
                    style: TextStyle(fontSize: 25.0, fontFamily: 'Raleway'),
                  ),
                  subtitle: Text(
                    birdlistCNInstance.listOfBirds[index].scientificName,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.red[700],
                    onPressed: () {
                      birdlistCNInstance.deleteABird(
                          birdlistCNInstance.listOfBirds[index].id);
                    },
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: birdlistCNInstance.listOfBirds.length < 7
            ? FloatingActionButton(
                onPressed: () {
                  navigateToAddNewBirdScreen(context);
                },
                tooltip: 'Add New Bird',
                child: Icon(Icons.add),
              )
            : null,
      ),
    );
  }
}

// Image(
//                     image: NetworkImage(eachBird.imageUrl),
//                     width: 100,
//                     fit: BoxFit.fitWidth),
