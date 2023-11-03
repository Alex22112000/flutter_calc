import 'package:flutter/material.dart';
import 'package:flutter_calc/infrastructure/ui/colors/colors.dart';
import 'package:flutter_calc/infrastructure/ui/widgets/button.dart';

class InputSection extends StatefulWidget {
  final Function(String) onChange;
  final Function() onReady;

  const InputSection(
      {super.key, required this.onChange, required this.onReady});

  @override
  State<InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends State<InputSection> {
  String inputExpression = "";

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

  bool isOperator(String y) {
    if (y == "/" || y == "*" || y == "-" || y == "+") {
      return true;
    }
    return false;
  }

  void deleteBtnAction() {
    if (inputExpression.isEmpty) return;
    setState(() {
      inputExpression =
          inputExpression.substring(0, inputExpression.length - 1);
    });
    widget.onChange(inputExpression);
  }

  void clearInput() {
    setState(() {
      inputExpression = "";
    });
    widget.onChange(inputExpression);
  }

  void equalBtnAction() {
    widget.onReady();
  }

  void onBtnTapped(String buttonText) {
    setState(() {
      inputExpression += buttonText;
    });
    widget.onChange(inputExpression);
  }

  @override
  Widget build(BuildContext context) {
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
                          deleteBtnAction();
                        },
                        color: DarkColors.btnBgColor,
                        textColor: DarkColors.leftOperatorColor,
                        text: buttons[index]);

                  /// CLEAR BTN
                  case 2:
                    return CustomButton(
                        buttonTapped: () {
                          clearInput();
                        },
                        color: DarkColors.btnBgColor,
                        textColor: DarkColors.leftOperatorColor,
                        text: buttons[index]);

                  // EQUAL BTN
                  case 19:
                    return CustomButton(
                        buttonTapped: () {
                          equalBtnAction();
                        },
                        color: DarkColors.btnBgColor,
                        textColor: DarkColors.leftOperatorColor,
                        text: buttons[index]);

                  default:
                    return CustomButton(
                        buttonTapped: () {
                          onBtnTapped(buttons[index]);
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
