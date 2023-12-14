import 'package:flutter_calc/domain/api/i_calculator.dart';
import 'package:flutter_calc/domain/api/i_calculator_service.dart';

class CalculatorService implements ICalculatorService {
  final ICalculator _calculator;

  CalculatorService(this._calculator);

  @override
  Future<double?> calculate(String expression) async {
    try {
      return await _calculator.calculate(expression);
    } catch (e) {
      return null;
    }
  }
}
