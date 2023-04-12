import 'dart:ui';

class ColorConst {
  static final _instance = ColorConst._internal();

  ColorConst._internal();

  factory ColorConst() {
    return _instance;
  }
  static const Color lightBlue = Color(0xff62CDFF);
}
