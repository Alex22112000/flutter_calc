import 'package:flutter_calc/domain/history/result.dart';

abstract class ICalculatorHistory {
  Future<List<Result>> getHistory();
}