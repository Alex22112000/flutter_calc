//import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_calc/infrastructure/provider/calculator.dart';
import 'package:flutter_calc/infrastructure/ui/colors/colors.dart';
import 'package:flutter_calc/infrastructure/ui/widgets/button.dart';
import 'package:provider/provider.dart';

class InputSection extends StatelessWidget {

  final List<String> buttons = [
    ".",
    "DEL",
    "C",
    "/",
    "1",
    "2",
    "3",
    "*",
    "4",
    "5",
    "6",
    "+",
    "7",
    "8",
    "9",
    "-",
    "0",
    "(",
    ")",
    "="
  ];

  InputSection({super.key});

  bool isOperator(String y) {
    if (y == "/" || y == "*" || y == "-" || y == "+") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // context - пробрасывается в виджеты и нужен для отрисовки
    // read<T> - нужен для вызова функций из T
    var calculator = context.read<Calculator>();
    //log("build widget");

    return Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
              color: DarkColors.sheetBgColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (contex, index) {
                switch (index) {
                  /// DELETE BTN
                  case 1:
                    return CustomButton(
                        buttonTapped: () {
                          // извлекаем из provider метод delete()
                          calculator.delete();
                        },
                        color: DarkColors.btnBgColor,
                        textColor: DarkColors.leftOperatorColor,
                        text: buttons[index]);

                  /// CLEAR BTN
                  case 2:
                    return CustomButton(
                        buttonTapped: () {
                          calculator.clear();
                        },
                        color: DarkColors.btnBgColor,
                        textColor: DarkColors.leftOperatorColor,
                        text: buttons[index]);

                  // EQUAL BTN
                  case 19:
                    return CustomButton(
                        buttonTapped: () {
                          calculator.calculate();
                        },
                        color: DarkColors.btnBgColor,
                        textColor: DarkColors.leftOperatorColor,
                        text: buttons[index]);

                  default:
                    return CustomButton(
                        buttonTapped: () {
                          calculator.addSymbol(buttons[index]);
                        },
                        color: DarkColors.btnBgColor,
                        textColor: isOperator(buttons[index])
                            ? LightColors.operatorColor
                            : Colors.white,
                        text: buttons[index]);
                }
              }),
        ));
  }
}
