import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:herculas_bluetooth_connectivity/bloc/range_bloc.dart';
import 'package:herculas_bluetooth_connectivity/constant/font_family_constant.dart';
import 'package:herculas_bluetooth_connectivity/constant/image_constant.dart';
import 'package:herculas_bluetooth_connectivity/widget/get_data_button_card.dart';
import 'package:herculas_bluetooth_connectivity/widget/history_session.dart';
import 'package:herculas_bluetooth_connectivity/widget/set_data_button_card.dart';

class RangeScreen extends StatefulWidget {
  const RangeScreen({Key? key}) : super(key: key);

  @override
  State<RangeScreen> createState() => _RangeScreenState();
}

class _RangeScreenState extends State<RangeScreen> {
  late RangeBloc _rangeBloc;
  @override
  void initState() {
    super.initState();
    _rangeBloc = RangeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          children: [
            SvgPicture.asset(ImageConstant.arrowLeft),
            const Text(
              "Range",
              style: TextStyle(
                fontSize: 25,
                fontFamily: FontConstant.timNewRoman,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 34),
            SvgPicture.asset(ImageConstant.dashboardImage),
            const SizedBox(height: 34),
            StreamBuilder<int>(
              stream: _rangeBloc.rangeCounter,
              builder: (context, snapshot) {
                return SetDataButtonCard(
                  label: 'This will allow you to set range of your choice',
                  value: _rangeBloc.rangeCounter.valueOrNull.toString(),
                  buttonText: "Set Range",
                  setRange: () {},
                  incrementedRange: (incrementedRange) {
                    _rangeBloc.incrementRange();
                  },
                  decrementedRange: (decrementedRange) {
                    _rangeBloc.decrementRange();
                  },
                );
              },
            ),
            const SizedBox(height: 27),
            GetDataButtonCard(
              label: 'This card will show your specified range',
              buttonText: 'Get DB',
              value: '5',
              setRange: () {},
            ),
            const SizedBox(height: 50),
            StreamBuilder<bool>(
                initialData: false,
                stream: _rangeBloc.isHistoryEnable,
                builder: (context, snapshot) {
                  return HistorySession(
                    isHistorySession: snapshot.data!,
                    onChanges: (val) {
                      print(val);
                      _rangeBloc.isHistoryEnable.add(val);
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
