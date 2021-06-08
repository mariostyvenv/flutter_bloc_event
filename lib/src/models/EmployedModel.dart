import 'dart:convert';
import 'package:flutter_bloc_1/classes/Employed.dart';
import 'package:http/http.dart' as http;

class EmployedModel {
  static Future<List<Employed>> getEmployes() async {
    List<Employed> employes = [];
    List<dynamic> resEmployesJson = [];
    http.Response response;

    response = await http.get(Uri.parse('http://192.168.1.3:3000/listar'));
    Map<String, dynamic> resObj = jsonDecode(response.body);

    resEmployesJson = resObj['data'];

    for (dynamic item in resEmployesJson) {
      employes.add(
        Employed(
          id: item['_id'],
          names: item['names'],
          lastnames: item['lastnames'],
          cellphone: item['cellphone'],
          email: item['email'],
          password: item['password'],
        ),
      );
    }

    return employes;
  }
}
