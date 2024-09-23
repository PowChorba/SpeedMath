import 'dart:math';

double hwComponent(double runway, double windDirection, double windIntesity) {
  double result =
      windIntesity * cos((runway - windDirection).abs() * (pi / 180));
  return double.parse(result.toStringAsFixed(2));
}
