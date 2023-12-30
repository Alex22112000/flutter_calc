import 'dart:convert';
import 'package:flutter_calc/domain/api/i_calculator_service.dart';
import 'package:flutter_calc/domain/history/i_calculator_repository.dart';
import 'package:flutter_calc/domain/history/result.dart';
import 'package:flutter_calc/infrastructure/data/database_results.dart';
import 'package:http/http.dart' as http;

class CalculatorOnline implements ICalculatorService {

  final _url = 'http://192.168.0.129:8080/api/calculations';
  final ICalculatorRepository _history = DatabaseResults();
  
  @override
  Future<double?> calculate(String expression) async {
    try {
      var response = await http.post(Uri.parse(_url), body: json.encode({'expression': expression}));
      if (response.statusCode == 200) {
        var data = json.decode(response.body).toString();
        _history.add(Result(inputNumber: expression, outputNumber: data.toString()));
        return double.parse(data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}