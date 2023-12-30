import 'package:flutter/material.dart';
import 'package:flutter_calc/infrastructure/ui/colors/colors.dart';
import 'package:flutter_calc/infrastructure/ui/widgets/input_section.dart';
import 'package:flutter_calc/infrastructure/ui/widgets/output_section.dart';
import 'package:flutter_calc/infrastructure/ui/widgets/switch_section.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkColors.scaffoldBgColor,
      body: SafeArea(child: 
      Column(
        children: [const SwitchSection(), const OutputSection(), InputSection()],
      ),)
    );
  }
}
