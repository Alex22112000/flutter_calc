import 'package:flutter_calc/domain/api/i_calculator.dart';
import 'package:flutter_calc/domain/api/i_calculator_service.dart';
import 'package:flutter_calc/domain/api/i_expression_parser.dart';

class CalculatorService implements ICalculatorService {
  final IExpressionParser _parser;
  final ICalculator _calculator;

  CalculatorService(this._parser, this._calculator);

  @override
  double calculate(String expression) =>
      _calculator.calculate(_parser.parse(expression));
}
