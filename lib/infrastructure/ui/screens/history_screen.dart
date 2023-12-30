import 'package:flutter/material.dart';
import 'package:flutter_calc/infrastructure/provider/calculator.dart';
import 'package:flutter_calc/infrastructure/ui/widgets/result_widget.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final calculator = context.watch<Calculator>();

    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisSize: MainAxisSize.max,
      children: calculator.savedResults.map((e) => ResultWidget(e)).toList().reversed.toList()
    )));
  }
}