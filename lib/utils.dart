import 'dart:math';

// takes mass in kgs and height in meters
double calculateBMI(double mass, double height) {
  return toPrecision(mass / pow(height, 2), 2);
}

double constrain(double t, double a, double b) {
  return t < a ? a : t > b ? b : t;
}

double toPrecision(double value, int places){
  double mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}