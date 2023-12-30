import 'package:flutter_calc/domain/api/i_calculator.dart';
import 'package:flutter_calc/domain/api/i_calculator_service.dart';
import 'package:flutter_calc/domain/history/i_calculator_repository.dart';
import 'package:flutter_calc/domain/history/result.dart';
import 'package:flutter_calc/infrastructure/data/database_results.dart';

class CalculatorService implements ICalculatorService {
  final ICalculator _calculator;
  final ICalculatorRepository _history = DatabaseResults();

  CalculatorService(this._calculator);

  @override
  Future<double?> calculate(String expression) async {
    try {
      final result = await _calculator.calculate(expression);
      _history.add(Result(inputNumber: expression, outputNumber: result.toString()));
      return result;
    } catch (e) {
      return null;
    }
  }
}
