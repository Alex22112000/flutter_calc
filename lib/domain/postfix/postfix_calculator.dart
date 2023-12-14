import 'package:flutter_calc/domain/api/i_calculator.dart';
import 'package:flutter_calc/domain/postfix/postfix_expression_parser.dart';
import 'package:stack/stack.dart';

class PostfixCalculator implements ICalculator {

  final _parser = PostfixExpressionParser();

  @override
  Future<double> calculate(String expression) async { // передаем tokens - распарсенное выражение
    List<String> tokens = _parser.parse(expression);
    final locals = Stack<double>();

    for (final token in tokens) {
      if (double.tryParse(token) != null) {
        locals.push(double.parse(token));
      } else if (_isOperator(token)) { // проверка на то, является ли token - оператором или же числом
        if (token == '~') {
          double last = locals.isNotEmpty ? locals.pop() : 0;

          locals.push(_execute("-", 0, last));
          continue;
        }

        double second = locals.isNotEmpty ? locals.pop() : 0,
            first = locals.isNotEmpty ? locals.pop() : 0;

        locals.push(_execute(token, first, second));
      }
    }
    return locals.pop();
  }

  bool _isOperator(String token) { // доступные операторы
    return ["+", "-", "*", "/", "~"].contains(token);
  }

  double _execute(String op, double first, double second) { // что происходит при выборе оператора
    switch (op) {
      case '+':
        return first + second;
      case '-':
        return first - second;
      case '*':
        return first * second;
      case '/':
        return first / second;
      default:
        return 0;
    }
  }
}
