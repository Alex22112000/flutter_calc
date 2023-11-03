import 'package:flutter/material.dart';

class OutputSection extends StatelessWidget {
  final String inputText;
  final String outputText;

  const OutputSection({
    Key? key,
    required this.inputText,
    required this.outputText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  inputText,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Text(outputText,
                    style: const TextStyle(color: Colors.white, fontSize: 32)),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
