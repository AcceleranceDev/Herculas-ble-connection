import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:herculas_bluetooth_connectivity/bloc/database_bloc.dart';
import 'package:herculas_bluetooth_connectivity/constant/font_family_constant.dart';
import 'package:herculas_bluetooth_connectivity/constant/image_constant.dart';
import 'package:herculas_bluetooth_connectivity/widget/get_data_button_card.dart';
import 'package:herculas_bluetooth_connectivity/widget/history_session.dart';
import 'package:herculas_bluetooth_connectivity/widget/set_data_button_card.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({Key? key}) : super(key: key);

  @override
  State<DatabaseScreen> createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  late DatabaseBloc _databaseBloc;
  @override
  void initState() {
    super.initState();
    _databaseBloc = DatabaseBloc();
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
              "Database",
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
              stream: _databaseBloc.databaseCounter,
              builder: (context, snapshot) {
                return SetDataButtonCard(
                  label: 'This will allow you to set range of your choice',
                  value: _databaseBloc.databaseCounter.valueOrNull.toString(),
                  buttonText: "Set Range",
                  setRange: () {},
                  incrementedRange: (incrementedRange) {
                    _databaseBloc.incrementRange();
                  },
                  decrementedRange: (decrementedRange) {
                    _databaseBloc.decrementRange();
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
                stream: _databaseBloc.isHistoryEnable,
                builder: (context, snapshot) {
                  return HistorySession(
                    isHistorySession: snapshot.data!,
                    onChanges: (val) {
                      _databaseBloc.isHistoryEnable.add(val);
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
