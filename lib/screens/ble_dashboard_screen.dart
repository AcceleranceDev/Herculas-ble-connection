import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:herculas_bluetooth_connectivity/base/i18n/i18n_engine.dart';
import 'package:herculas_bluetooth_connectivity/constant/image_constant.dart';
import 'package:herculas_bluetooth_connectivity/locale/app_localizations.dart';
import 'package:herculas_bluetooth_connectivity/model/card_entity.dart';
import 'package:herculas_bluetooth_connectivity/route/route_constant.dart';
import 'package:herculas_bluetooth_connectivity/widget/dashboard_card.dart';

class BleDashboardScreen extends StatelessWidget {
  const BleDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          children: [
            SvgPicture.asset(ImageConstant.arrowLeft),
            const SizedBox(height: 19),
            Text(
              AppLocalizations.yourAppGotMoreHelpful.i18n,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 31),
            SvgPicture.asset(ImageConstant.dashboardImage),
            const SizedBox(height: 43),
            GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: CardEntity.getDashboardCardEntity()
                    .map(
                      (e) => GestureDetector(
                        onTap: () => _onClickRoute(context, e),
                        child: DashboardCard(
                          asset: e.assest,
                          title: e.title,
                          subtitle: e.subtitle,
                        ),
                      ),
                    )
                    .toList()),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  void _onClickRoute(BuildContext context, CardEntity e) {
    switch (e.title) {
      case "Range":
        Navigator.pushNamed(context, RouteConstant.rangeScreen);
        break;
      case "Database":
        Navigator.pushNamed(context, RouteConstant.databaseScreen);
        break;
      case "Dev Info":
        Navigator.pushNamed(context, RouteConstant.devInfo);
        break;
      default:
        Navigator.pushNamed(context, RouteConstant.synRTC);
    }
  }
}
