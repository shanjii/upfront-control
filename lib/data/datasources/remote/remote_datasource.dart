import 'dart:convert';

import 'package:upfront_controls/data/datasources/remote/endpoints.dart';
import 'package:upfront_controls/data/entities/keybind.dart';
import 'package:http/http.dart' as http;
import 'package:upfront_controls/main.dart';

class RemoteDatasource {
  static send({required Keybind keybind, required bool press}) async {
    try {
      var result = await http
          .post(
            press ? pressKeyUrl(kSettings) : releaseKeyUrl(kSettings),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(keybind.toJson()),
          )
          .timeout(const Duration(seconds: 2));

      if (result.statusCode != 200) {
        print(result.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
