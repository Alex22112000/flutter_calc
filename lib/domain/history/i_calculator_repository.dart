import 'package:flutter_calc/domain/history/result.dart';

abstract class ICalculatorRepository {
  Future<List<Result>> getAll();
  Future<void> add(Result result);
}