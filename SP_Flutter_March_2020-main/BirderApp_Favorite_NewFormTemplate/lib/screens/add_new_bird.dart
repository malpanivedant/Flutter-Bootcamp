import 'package:flutter/material.dart';

class AddNewBirdWidget extends StatefulWidget {
  @override
  _AddNewBirdWidgetState createState() => _AddNewBirdWidgetState();
}

class _AddNewBirdWidgetState extends State<AddNewBirdWidget> {
  Widget _buildBirdName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Bird Name',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Bird Name required !"; // Error !
        }
        return null; // not an error !
      },
    );
  }

  Widget _buildBirdScientificName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Scientific Name',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Scientific Name required !"; // Error !
        }
        return null; // not an error !
      },
    );
  }

  Widget _buildBirdImageUrl() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Image URL',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Image URL required !"; // Error !
        }
        return null; // not an error !
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Bird'), // bad should come dynamically
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildBirdName(),
              ElevatedButton(
                child: Text(
                  'Add new bird',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  print('U clicked !');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
