import 'package:flutter_calc/domain/api/i_calculator.dart';
import 'package:flutter_calc/domain/api/i_calculator_service.dart';
import 'package:flutter_calc/infrastructure/data/calculator_online.dart';
import 'package:flutter_calc/domain/calculator_service.dart';
import 'package:flutter_calc/domain/postfix/postfix_calculator.dart';

enum CalculatorServiceType { offline, online }

class CalculatorServiceFactory {
  static ICalculatorService create(CalculatorServiceType type) {
    ICalculator calculator;

    switch (type) {
      case CalculatorServiceType.offline:
        {
          calculator = PostfixCalculator();
          return CalculatorService(calculator);
        }
      case CalculatorServiceType.online:
        {
          return CalculatorOnline();
        }
      default:
        {
          calculator = PostfixCalculator();
          return CalculatorService(calculator);
        }
    }
  }
}
