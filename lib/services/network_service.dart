// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkService {
  final Uri url;

  NetworkService({required this.url});

  Future getData() async {
    http.Response response = await http.get(url);
    String data = response.body;
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
