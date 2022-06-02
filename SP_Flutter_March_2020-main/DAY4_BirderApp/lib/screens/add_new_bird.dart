import 'dart:math';

import '../models/bird_list_model_change_notifier.dart';
import 'package:birderapp/models/bird_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewBirdWidget extends StatefulWidget {
  @override
  _AddNewBirdWidgetState createState() => _AddNewBirdWidgetState();
}

class _AddNewBirdWidgetState extends State<AddNewBirdWidget> {
  BirdModel _newBird;
  String _txtName;
  String _txtScientificName;
  String _txtImageUrl;
  String _txtInfo;
  Random _random = Random(); // not best practise

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      onSaved: (String value) {
        _txtName = value;
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
      onSaved: (String value) {
        _txtScientificName = value;
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
      onSaved: (String value) {
        _txtImageUrl = value;
      },
    );
  }

  Widget _buildBirdInfo() {
    return TextFormField(
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: 'Description',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Decscription required !"; // Error !
        }
        return null; // not an error !
      },
      onSaved: (String value) {
        _txtInfo = value;
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildBirdName(),
                _buildBirdScientificName(),
                _buildBirdImageUrl(),
                _buildBirdInfo(),
                ElevatedButton(
                  child: Text(
                    'Add new bird',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    // validate - GlobalKey -> FormState -> currentState() -> validate()

                    //Validates every [FormField] that is a descendant of this [Form], and returns true if there are no errors.
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    _newBird = BirdModel(
                        id: _random.nextInt(100), // bad
                        //id: 10, // find max id then increement
                        name: _txtName,
                        scientificName: _txtScientificName,
                        imageUrl: _txtImageUrl,
                        info: _txtInfo);

                    // if validate -> success , add to the BirdList
                    Provider.of<BirdListChangeNotifier>(
                      context,
                      listen: false,
                    ).addNewBirdToList(_newBird);
                    Navigator.of(context)
                        .pop("success"); // check with database first
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
