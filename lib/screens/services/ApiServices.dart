import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  List data;

  Future<List> getData() async {
    var url = "https://irent.id/api/v1/cars/owners";
    var response = await http.get(Uri.encodeFull(url));
    var jsonData = json.decode(response.body);
    data = jsonData;
    return data;
  }
}
