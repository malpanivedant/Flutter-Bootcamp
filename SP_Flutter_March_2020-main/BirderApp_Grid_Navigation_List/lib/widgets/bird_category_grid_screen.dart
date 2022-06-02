import 'package:birderapp/models/bird_category_model.dart';
import 'package:birderapp/utilities/color_generator.dart';
import 'package:birderapp/widgets/bird_list_using_card_listview.dart';
import 'package:flutter/material.dart';

class BirdsCategoryScreen extends StatelessWidget {
  final List<BirdCategoryModel> listofcategories;

  BirdsCategoryScreen({this.listofcategories});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BirdListWidget(),
                ),
              );
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
    ));
  }
}
