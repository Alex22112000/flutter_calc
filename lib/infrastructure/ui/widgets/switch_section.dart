import 'package:flutter/material.dart';
import 'package:flutter_calc/infrastructure/provider/calculator.dart';
import 'package:provider/provider.dart';

class SwitchSection extends StatelessWidget {
  const SwitchSection({super.key});

  @override
  Widget build(BuildContext context) {

    var calculator = context.watch<Calculator>();

    return Row(
      children: [
        Switch(
          activeColor: Colors.white,
          value: calculator.isOnline, onChanged: (e) {
            calculator.changeMod();
        }),
        const SizedBox(
          width: 10,
        ),
        if(calculator.isLoading) const CircularProgressIndicator(
          color: Colors.white,
        )
      ],
    );
  }
}