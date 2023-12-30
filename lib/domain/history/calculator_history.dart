import 'package:flutter_calc/domain/history/i_calculator_history.dart';
import 'package:flutter_calc/domain/history/i_calculator_repository.dart';
import 'package:flutter_calc/domain/history/result.dart';
import 'package:flutter_calc/infrastructure/data/database_results.dart';

class CalculatorHistory implements ICalculatorHistory {

  final ICalculatorRepository repository = DatabaseResults();

  @override
  Future<List<Result>> getHistory() {
    return repository.getAll();
  }
}