import 'package:flutter/material.dart';
import 'ui/interfaz.dart';

void main() {
  runApp(CalculadorRectanguloApp());
}

class CalculadorRectanguloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InterfazRectangulo(),
    );
  }
}
