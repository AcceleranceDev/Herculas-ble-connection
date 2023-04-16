import 'package:herculas_bluetooth_connectivity/constant/image_constant.dart';

class CardEntity {
  final String assest;
  final String title;
  final String subtitle;

  CardEntity({
    required this.assest,
    required this.title,
    required this.subtitle,
  });

  static List<CardEntity> getDashboardCardEntity() {
    return [
      CardEntity(
        assest: ImageConstant.dashboardImage,
        title: "Range",
        subtitle: "By clicking on this card you can set and  get your range",
      ),
      CardEntity(
        assest: ImageConstant.dashboardImage,
        title: "Database",
        subtitle: "By clicking on this card you can set and  get your DB values",
      ),
      CardEntity(
        assest: ImageConstant.dashboardImage,
        title: "Dev Info",
        subtitle: "By clicking on this card you can view the dev information",
      ),
      CardEntity(
        assest: ImageConstant.dashboardImage,
        title: "Sync RTC",
        subtitle: "By clicking on this card you can view the dev information",
      ),
    ];
  }
}
