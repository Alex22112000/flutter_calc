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
        ),
        ElevatedButton(onPressed: () { 
            calculator.updateHistory();
            Navigator.of(context).pushNamed("/history");
          }, child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: const Text(
                    'История',
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  )),)
      ],
    );
  }
}