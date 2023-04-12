class ImageConstant {
  static final _instance = ImageConstant._internal();

  ImageConstant._internal();

  factory ImageConstant() {
    return _instance;
  }

  static const String _basePath = 'assets/images';
  static String dashboardImage = '$_basePath/dashboard_image.svg';
  static String screen1Bluetooth = '$_basePath/screen1-bluetooth.svg';
  static String filledBluetooth = '$_basePath/filled-bluetooth.svg';
  static String arrowLeft = '$_basePath/arrow-left.svg';
}
