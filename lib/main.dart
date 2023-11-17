import 'package:flutter/material.dart';
import 'package:flutter_calc/infrastructure/provider/calculator.dart';
import 'package:flutter_calc/infrastructure/ui/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // обертка нужна для того, чтобы виджеты с нижних уровней могли использовать provider с более высоких уровней
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Calculator())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Calculator",
        home: MainScreen(),
      ),
    );
  }
}
