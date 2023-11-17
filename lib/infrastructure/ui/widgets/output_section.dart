//import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_calc/infrastructure/provider/calculator.dart';
import 'package:provider/provider.dart';

class OutputSection extends StatelessWidget {
  const OutputSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // watch<T> - наблюдает за именениями на T (изменения в state)
    var calculator = context.watch<Calculator>();
    //log("build widget");

    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 70),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  // получение значения из поля input
                  calculator.input,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Text(calculator.output,
                    style: const TextStyle(color: Colors.white, fontSize: 32)),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
