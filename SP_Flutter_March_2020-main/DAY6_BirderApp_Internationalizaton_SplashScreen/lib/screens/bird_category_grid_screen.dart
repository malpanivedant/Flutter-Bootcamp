import 'package:birderapp/models/bird_category_model.dart';
import 'package:birderapp/utilities/color_generator.dart';
import 'package:birderapp/screens/bird_list_using_card_listview_screen.dart';
import 'package:birderapp/widgets/birderapp_drawer_widget.dart';
import 'package:flutter/material.dart';

class BirdsCategoryScreen extends StatelessWidget {
  final List<BirdCategoryModel> listofcategories = [
    BirdCategoryModel(
        name: 'All Birds',
        id: 1,
        imageUrl:
            'https://images.vexels.com/media/users/3/189921/isolated/preview/b1a526c86ebc75b00e99b0ee5dcf133f-standing-pigeons-silhouette-by-vexels.png'),
    BirdCategoryModel(
        name: 'Waders',
        id: 2,
        imageUrl:
            'https://images.vexels.com/media/users/3/189725/isolated/preview/64dc0d9525f8fae057b4c345a7231270-flying-pigeon-silhouette-by-vexels.png'),
    BirdCategoryModel(
        name: 'Perching Birds',
        id: 3,
        imageUrl:
            'https://images.vexels.com/media/users/3/189725/isolated/preview/64dc0d9525f8fae057b4c345a7231270-flying-pigeon-silhouette-by-vexels.png'),
    BirdCategoryModel(
        name: 'Tree-clinging Birds',
        id: 4,
        imageUrl:
            'https://cdn11.bigcommerce.com/s-xj69ljw63/images/stencil/266x266/v/bird-woodpecker-control-266x266__19563.original.png'),
    BirdCategoryModel(
        name: 'Seabirds',
        id: 5,
        imageUrl:
            'https://www.pngkey.com/png/full/286-2863867_white-bird-black-background.png'),
    BirdCategoryModel(
        name: 'Birds Of Prey',
        id: 6,
        imageUrl:
            'https://webcomicms.net/sites/default/files/clipart/168765/white-eagle-cliparts-168765-3390204.png'),
    BirdCategoryModel(
        name: 'Flighless Birds',
        id: 7,
        imageUrl:
            'https://images.vexels.com/media/users/3/189725/isolated/preview/64dc0d9525f8fae057b4c345a7231270-flying-pigeon-silhouette-by-vexels.png'),
    BirdCategoryModel(
        name: 'Pet Birds',
        id: 8,
        imageUrl:
            'https://cdn11.bigcommerce.com/s-xj69ljw63/images/stencil/266x266/v/bird-woodpecker-control-266x266__19563.original.png')
  ];

  final String appTitle = 'Birder\'s App';
  static const routeName = "/home";

  BirdsCategoryScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BirderDrawer(),
      appBar: AppBar(
        title: Text('$appTitle'),
        centerTitle: true,
      ),
      body: Container(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2, // dynamic based on orientation - MediaQuery
          children: <Widget>[
            ...listofcategories.map(
              (eachCategory) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, BirdListWidget.routeName);
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(eachCategory.imageUrl,
                          width: 130, height: 130, fit: BoxFit.contain),
                      Container(
                        child: Text(eachCategory.name,
                            style: TextStyle(fontSize: 22),
                            softWrap: false,
                            overflow: TextOverflow.fade),
                      ),
                    ],
                  ),
                  color: UniqueColorGenerator.getColor(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
