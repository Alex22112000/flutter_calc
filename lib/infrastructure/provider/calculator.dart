import 'package:flutter/widgets.dart';
import 'package:flutter_calc/domain/calculator_sevice_factory.dart';

final calculatorService =
    CalculatorServiceFactory.create(CalculatorServiceType.postfix);

// ChangeNotifier в provider - способ инкапсулировать состояние приложения (следить за изменениями)
class Calculator with ChangeNotifier { 
  String _input = "";
  String _output = "";

  String get input => _input;
  String get output => _output;

  void delete() {
    if (_input.isEmpty) return;
    _input = _input.substring(0, _input.length - 1);
    // notifyListeners() - вызывается каждый раз, когда state изменяется так, что это может отразиться в UI
    notifyListeners();
  }

  void clear() {
    _input = "";
    _output = "";
    notifyListeners();
  }

  void calculate() {
    _output = calculatorService.calculate(_input).toString();
    notifyListeners();
  }

  void addSymbol(String symbol) {
    _input += symbol;
    notifyListeners();
  }
}
