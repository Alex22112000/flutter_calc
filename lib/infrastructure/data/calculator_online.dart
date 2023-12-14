import 'dart:convert';
import 'package:flutter_calc/domain/api/i_calculator_service.dart';
import 'package:http/http.dart' as http;

class CalculatorOnline implements ICalculatorService {

  final String _url = 'http://192.168.224.146:8080/api/calculations';

  @override
  Future<double?> calculate(String expression) async {
    try {
      var response = await http.post(Uri.parse(_url), body: json.encode({'expression': expression}));
      if (response.statusCode == 200) {
        var data = json.decode(response.body).toString();
        return double.parse(data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}