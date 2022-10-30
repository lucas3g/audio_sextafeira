import 'package:flutter/cupertino.dart';

class Constants {
  static int currentIndex = 0;
}

extension ContextExtensions on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}
