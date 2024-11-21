Map<String, double> calcularRectangulo(double base, double altura) {
  final double area = base * altura;
  final double perimetro = 2 * (base + altura);

  return {
    'area': area,
    'perimetro': perimetro,
  };
}
