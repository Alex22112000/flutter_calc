import 'package:flutter/widgets.dart';
import 'package:flutter_calc/domain/calculator_sevice_factory.dart';

// ChangeNotifier в provider - способ инкапсулировать состояние приложения (следить за изменениями)
class Calculator with ChangeNotifier { 
  String _input = "";
  String _output = "";

  String get input => _input;
  String get output => _output;

  bool isOnline = false;
  bool isLoading = false;

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

  void calculate() async {
    final calculator = CalculatorServiceFactory.create(isOnline ? CalculatorServiceType.online : CalculatorServiceType.offline);
    isLoading = true;
    notifyListeners();
    final result = await calculator.calculate(_input);
    if(result == null){
      _output = "Error";
    } else {
      _output = result.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  void addSymbol(String symbol) {
    _input += symbol;
    notifyListeners();
  }

  void changeMod(){
    isOnline = !isOnline;
    notifyListeners();
  }
}
