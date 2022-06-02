import 'package:birderapp/models/bird_hotspot_model.dart';
import 'package:birderapp/widgets/birderapp_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class BirdingHotSpotScreen extends StatefulWidget {
  static const routeName = '/birdinghotspots';

  @override
  _BirdingHotSpotScreenState createState() => _BirdingHotSpotScreenState();
}

class _BirdingHotSpotScreenState extends State<BirdingHotSpotScreen> {
  List<HotSpotModel> spots = [
    HotSpotModel(
      latitude: 15.2361181,
      longitude: 74.5997722,
      name: 'Dandli,KA',
    ),
    HotSpotModel(
      latitude: 45.2343411,
      longitude: 24.5497722,
      name: 'Coorg,KL',
    ),
    HotSpotModel(
      latitude: 25.6565471,
      longitude: 64.5897722,
      name: 'Thane creek,MH',
    ),
  ];
  Location _location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  void _addCurrentLocationToHotSpots() async {
    // service is enabled
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // ask for permission

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await _location.getLocation();
    // print('${_locationData.latitude},${_locationData.longitude}');

    setState(() {
      spots.add(
        HotSpotModel(
            latitude: _locationData.latitude,
            longitude: _locationData.longitude,
            name: 'Pune,MH'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birding Hotspots'),
        centerTitle: true,        
      ),
      drawer: BirderDrawer(),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: spots.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return Card(
                elevation: 6,
                child: ListTile(
                  leading: Icon(
                    Icons.place_outlined,
                    size: 40,
                    color: Colors.blue[300],
                  ),
                  title: Text(spots[index].name,
                      style: TextStyle(fontSize: 20.0, color: Colors.black)),
                  subtitle: Text(
                      '[${spots[index].latitude},${spots[index].longitude}]',
                      style: TextStyle(fontSize: 18.0, color: Colors.black)),
                ),
              );
            },
          ),
          ElevatedButton(
              onPressed: _addCurrentLocationToHotSpots,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.place),
                  Text(
                    'Add current location as hotspot',
                  )
                ],
              ))
        ],
      ),
    );
  }
}
