// can also be a class

import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class FetchUsers {
  Future<UserModel> fetchUsers() async {
    // make http request
    var url = Uri.https('jsonplaceholder.typicode.com', 'users/1');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
      // list of users
    } else {
      print(response.statusCode);
      // throw an exception
    }
  }
}

//  if (response.statusCode == 200) {
//       var users = json.decode(response.body); // like JSON.parse()
//       print(users);
//     }
