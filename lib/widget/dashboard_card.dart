import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:herculas_bluetooth_connectivity/constant/color_constant.dart';
import 'package:herculas_bluetooth_connectivity/constant/font_family_constant.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({Key? key, required this.asset, required this.title, required this.subtitle})
      : super(key: key);
  final String asset;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: ColorConst.dashboardCardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              asset,
              width: 16,
              height: 20,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 25,
                fontFamily: FontConstant.timNewRoman,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              subtitle,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                fontFamily: FontConstant.timNewRoman,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
