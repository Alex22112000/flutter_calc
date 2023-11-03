import 'package:flutter/material.dart';
import 'package:flutter_calc/domain/calculator_sevice_factory.dart';
import 'package:flutter_calc/infrastructure/ui/colors/colors.dart';
import 'package:flutter_calc/infrastructure/ui/widgets/input_section.dart';
import 'package:flutter_calc/infrastructure/ui/widgets/output_section.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _inputText = "";
  String _outputText = "";
  final calculatorService =
      CalculatorServiceFactory.create(CalculatorServiceType.postfix);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkColors.scaffoldBgColor,
      body: Column(
        children: [
          OutputSection(inputText: _inputText, outputText: _outputText),
          InputSection(
            onChange: (text) {
              setState(() {
                _outputText = "";
                _inputText = text;
              });
            },
            onReady: () {
              setState(() {
                _outputText =
                    calculatorService.calculate(_inputText).toString();
              });
            },
          )
        ],
      ),
    );
  }
}
