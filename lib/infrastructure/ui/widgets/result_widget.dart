import 'package:flutter/widgets.dart';
import 'package:flutter_calc/domain/history/result.dart';

class ResultWidget extends StatelessWidget {

  final Result result;

  const ResultWidget(this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(result.inputNumber, style: const TextStyle(fontSize: 32),),

        const Text(" = ", style: TextStyle(fontSize: 32),),

        Text(result.outputNumber, style: const TextStyle(fontSize: 32),),
      ],
    );
  }
}
