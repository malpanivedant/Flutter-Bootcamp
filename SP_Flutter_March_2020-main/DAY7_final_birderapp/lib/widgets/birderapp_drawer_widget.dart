import 'package:birderapp/models/menu_item_model.dart';
import 'package:birderapp/screens/add_new_bird_screen.dart';
import 'package:birderapp/screens/bird_category_grid_screen.dart';
import 'package:birderapp/screens/bird_list_using_card_listview_screen.dart';
import 'package:birderapp/screens/birding_hotspot_screen.dart';
import 'package:flutter/material.dart';

class BirderDrawer extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
        icon: Icons.home, name: 'Home', route: BirdsCategoryScreen.routeName),
    MenuItem(
        icon: Icons.add,
        name: 'Add New Bird',
        route: AddNewBirdWidget.routeName),
    MenuItem(
        icon: Icons.view_list,
        name: 'List of Birds',
        route: BirdListWidget.routeName),
    MenuItem(
        icon: Icons.location_city,
        name: 'Birding Hotspots',
        route: BirdingHotSpotScreen.routeName),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 6,
      child: Column(children: <Widget>[
        Stack(
          children: [
            Container(
              height: 200.0,
              decoration: BoxDecoration(color: Theme.of(context).accentColor),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.0),
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 48,
                        backgroundColor: Colors.amber,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Birder\'s App',
                      style: Theme.of(context).textTheme.headline1,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        // ListViewBuilder
        ListView.builder(
            shrinkWrap: true,
            itemCount: menuItems.length,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext ctx, int index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, menuItems[index].route);
                    },
                    child: ListTile(
                      leading: Icon(
                        menuItems[index].icon,
                        size: 30.0,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      title: Text(menuItems[index].name,
                          style: Theme.of(context).textTheme.headline4),
                    ),
                  ),
                  Divider(
                    thickness: 2.0,
                  )
                ],
              );
            })
      ]),
    );
  }
}
