import 'dart:convert';

import 'package:flutter_calc/domain/history/result.dart';
import 'package:flutter_calc/domain/history/i_calculator_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseResults implements ICalculatorRepository {


  @override
  Future<void> add(Result result) async {
    List<Result> results = await _getResults();
    results.add(result);
    _saveResults(results);
  }

  @override
  Future<List<Result>> getAll() {
    return _getResults();
  }
  
  Future<List<Result>> _getResults() async {
    final prefs = await SharedPreferences.getInstance();
    List<Result> results = [];
    List<String>? resultsJson = prefs.getStringList("results");
    if (resultsJson != null) {
      for (String resultJson in resultsJson) {
        results.add(Result.fromJson(json.decode(resultJson)));
      }
    }
    return results;
  }

  Future<void> _saveResults(List<Result> results) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> resultsJson = [];
    for (Result result in results) {
        resultsJson.add(json.encode(result.toJson()));
    }
    prefs.setStringList('results', resultsJson);
  }
}
