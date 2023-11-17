import 'package:flutter/material.dart';
import 'package:flutter_calc/infrastructure/ui/colors/colors.dart';
import 'package:flutter_calc/infrastructure/ui/widgets/input_section.dart';
import 'package:flutter_calc/infrastructure/ui/widgets/output_section.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: DarkColors.scaffoldBgColor,
      body: Column(
        children: [OutputSection(), InputSection()],
      ),
    );
  }
}
