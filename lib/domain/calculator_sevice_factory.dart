import 'package:flutter_calc/domain/api/i_calculator.dart';
import 'package:flutter_calc/domain/api/i_calculator_service.dart';
import 'package:flutter_calc/domain/api/i_expression_parser.dart';
import 'package:flutter_calc/domain/calculator_service.dart';
import 'package:flutter_calc/domain/postfix/postfix_calculator.dart';
import 'package:flutter_calc/domain/postfix/postfix_expression_parser.dart';

enum CalculatorServiceType { postfix }

class CalculatorServiceFactory {
  static ICalculatorService create(CalculatorServiceType type) {
    IExpressionParser parser;
    ICalculator calculator;

    switch (type) {
      case CalculatorServiceType.postfix:
        {
          parser = PostfixExpressionParser();
          calculator = PostfixCalculator();
          break;
        }
      default:
        {
          parser = PostfixExpressionParser();
          calculator = PostfixCalculator();
          break;
        }
    }

    return CalculatorService(parser, calculator);
  }
}
