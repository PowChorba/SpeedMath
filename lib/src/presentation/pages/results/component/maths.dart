import 'dart:math';

double hwComponent(double runway, double windDirection, double windIntesity) {
  double result =
      windIntesity * cos((runway - windDirection).abs() * (pi / 180));
  return double.parse(result.toStringAsFixed(2));
}

double cwComponent(int runway, int windDirection, int windIntesity) {
  double result =
      windIntesity * sin((runway - windDirection).abs() * (pi / 180));
  return double.parse(result.toStringAsFixed(2));
}

int finalSpeed(int vref, double hwComponent, double gustDiference,
    int tailWindValue, bool flapPlacard, int maxFlapPlacard) {
  int speedVref =
      flapPlacard == false ? vref + tailWindValue : maxFlapPlacard - 5;

  return speedVref;
}

int windAditiveMath(int hwHalfComponent, int gustDiference, int hwComponent) {
  int temporalwind = hwComponent < 0 ? 5 : hwHalfComponent + gustDiference;

  int finalWindComp = temporalwind > 15 ? 15 : temporalwind;

  return finalWindComp;
}

bool limitedMaxRuleMath(
    int hwHalfComponent, int gustDiference, int hwComponent) {
  int temporalwind = hwComponent < 0 ? 5 : hwHalfComponent + gustDiference;
  bool finalWindComp = temporalwind > 15 ? true : false;

  return finalWindComp;
}
