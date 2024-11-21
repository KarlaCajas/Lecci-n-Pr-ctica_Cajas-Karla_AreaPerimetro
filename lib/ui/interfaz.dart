import 'package:flutter/material.dart';
import '../logica/calculador.dart';

class InterfazRectangulo extends StatefulWidget {
  @override
  _InterfazRectanguloState createState() => _InterfazRectanguloState();
}

class _InterfazRectanguloState extends State<InterfazRectangulo> {
  final _baseController = TextEditingController();
  final _alturaController = TextEditingController();

  double? _area;
  double? _perimetro;

  void calcular() {
    final double? base = double.tryParse(_baseController.text);
    final double? altura = double.tryParse(_alturaController.text);

    if (base == null || altura == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa números válidos.')),
      );
      return;
    }

    // Lógica importada desde calculador.dart
    final resultados = calcularRectangulo(base, altura);

    setState(() {
      _area = resultados['area'];
      _perimetro = resultados['perimetro'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // Fondo claro
      appBar: AppBar(
        backgroundColor: Color(0xFFB2A4A4), // Color palo de rosa oscuro
        title: Text(
          'Calculador de Área y Perímetro de Rectángulos',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),

            // Campo para la base
            TextField(
              controller: _baseController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Base del Rectángulo',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),

            // Campo para la altura
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura del Rectángulo',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),

            // Botón con cambio de color al pasar el mouse
            MouseRegion(
              onEnter: (_) {
                setState(() {}); // Trigger hover color
              },
              onExit: (_) {
                setState(() {}); // Reset hover color
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB2A4A4), // Color palo de rosa
                  foregroundColor: Colors.white, // Texto en blanco
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                ).copyWith(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Color(0xFFD9C9C9); // Color más claro al pasar el mouse
                      }
                      return Color(0xFFB2A4A4); // Color predeterminado
                    },
                  ),
                ),
                onPressed: calcular,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Calcular Área y Perímetro',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Mostrar resultados
            if (_area != null && _perimetro != null)
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Resultados:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB2A4A4),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Área: $_area',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    Text(
                      'Perímetro: $_perimetro',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
