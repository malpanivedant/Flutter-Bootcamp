import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/bird_model.dart';

class BirdService {
  static Future<String> addBirdToFirebaseDB(BirdModel newBird) async {
    // http pkg
    // http.post(url,datatoadded)
    try {
      const _domainString =
          'fbirderappsumeet-default-rtdb.europe-west1.firebasedatabase.app';
      const _urlString = "birds.json";
      // do not hardcode the url, u can accept url as parameter
      Uri url = Uri.https(_domainString, _urlString);
      var response = await http.post(
        url,
        body: json.encode({
          "id": newBird.id,
          "name": newBird.name,
          "scientificName": newBird.scientificName,
          "imageUrl": newBird.imageUrl,
          "info": newBird.info
        }),
      );

      // check the response from http.post()
      // if response.statusCode == 200
      // return "success"/ ResponseStatus (Model)

      if (response.statusCode == 200) {
        // returning string is bad
        //Should return a custom model -> ResponseStatus (Model)
        // or create a Enum
        return "Success";
      }

      return "";
    } catch (error) {
      // throw (error);
      print(error);
      return "Error : $error";
    }
  }

  static Future<List<BirdModel>> fetchBirdsFromDB() async {
    final List<BirdModel> loadedBirds = [];
    try {
      const _domainString =
          'fbirderappsumeet-default-rtdb.europe-west1.firebasedatabase.app';
      const _urlString = "birds.json";
      Uri url = Uri.https(_domainString, _urlString);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;

        extractedData.forEach((birdGenId, eachBird) {
          loadedBirds.add(
            BirdModel.fromJSON(eachBird),
          ); //extract the data and convert to strongly typed model
        });
      }
      return loadedBirds;
    } catch (error) {
      print(error);
      return loadedBirds;
    }
  }
}
