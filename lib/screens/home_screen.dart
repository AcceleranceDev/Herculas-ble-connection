import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:herculas_bluetooth_connectivity/bloc/bluetooth_bloc.dart';
import 'package:herculas_bluetooth_connectivity/constant/color_constant.dart';
import 'package:herculas_bluetooth_connectivity/state/bonded_bluetooth_state.dart';
import 'package:herculas_bluetooth_connectivity/state/discovered_bluetooth_state.dart';
import 'package:herculas_bluetooth_connectivity/theme/app_text_style.dart';
import 'package:herculas_bluetooth_connectivity/widget/history.dart';
import 'package:herculas_bluetooth_connectivity/widget/primary_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late BluetoothBloc _bluetoothBloc;

  @override
  void initState() {
    super.initState();
    _bluetoothBloc = BluetoothBloc();
    _bluetoothBloc.getBondedBluetoothDevices();
    _bluetoothBloc.getDiscoveredBluetoothDevice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.appBarColor,
      ),
      body: StreamBuilder<DiscoveredBluetoothState>(
        stream: _bluetoothBloc.discoveredBluetoothState,
        builder: (context, snapshot) {
          final discoveredState = snapshot.data;
          return StreamBuilder<BondedBluetoothState>(
            stream: _bluetoothBloc.boundedBluetoothState,
            builder: (context, snapshot) {
              final state = snapshot.data;
              if ((state?.isLoading() ?? false) ||
                  (discoveredState?.isLoading() ?? false)) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  Text(
                    "New Device",
                    style: AppTextStyle.header1,
                  ),
                  const SizedBox(height: 10),
                  if (discoveredState?.data == null ||
                      discoveredState!.data!.isEmpty)
                    Text(
                      "No New Device Found",
                      style: AppTextStyle.header1,
                    )
                  else
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: ColorConst.appBarColor,
                          width: 3,
                        ),
                      ),
                      child: Column(
                          children: discoveredState.data!
                              .map((e) => InkWell(
                                    onTap: () {
                                      _bluetoothBloc.connectToNewDevice(
                                          address: e.address, context: context);
                                    },
                                    child: BluetoothHistory(
                                      name: e.name,
                                    ),
                                  ))
                              .toList()),
                    ),
                  const SizedBox(height: 20),
                  Text(
                    "History",
                    style: AppTextStyle.header1,
                  ),
                  if (state?.data == null || state!.data!.isEmpty)
                    Text(
                      "No History Found",
                      style: AppTextStyle.header1,
                    )
                  else
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: ColorConst.appBarColor,
                          width: 3,
                        ),
                      ),
                      child: Column(
                          children: state.data!
                              .map(
                                (e) => InkWell(
                                  onTap: () {
                                    _bluetoothBloc.connectToBondedDevice(
                                      address: e.address,
                                      context: context,
                                    );
                                  },
                                  child: BluetoothHistory(
                                    name: e.name,
                                    onUnpairClick: () {
                                      _bluetoothBloc
                                          .removeBondedBluetoothDevice(
                                              address: e.address,
                                              context: context);
                                    },
                                  ),
                                ),
                              )
                              .toList()),
                    )
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class BondedBluetoothDevices extends StatelessWidget {
  const BondedBluetoothDevices({Key? key, this.data}) : super(key: key);
  final List<BluetoothDevice>? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.appBarColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Searching for\ndevices',
                style: AppTextStyle.header1,
              ),
              const SizedBox(height: 10),
              Text(
                'Make sure your phone’s bluetooth device is unlocked',
                style: AppTextStyle.title,
              ),
              const SizedBox(height: 35),
              Container(
                padding: const EdgeInsets.all(70),
                decoration: const BoxDecoration(
                  color: ColorConst.buttonColor,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                "History",
                style: AppTextStyle.header1,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorConst.appBarColor,
                      width: 3,
                    ),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      return BluetoothHistory(
                        name: data?[index].name,
                        onUnpairClick: () {},
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ConnectedBluetooth extends StatelessWidget {
  const _ConnectedBluetooth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.appBarColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Connected',
                style: AppTextStyle.header1,
              ),
              const SizedBox(height: 10),
              Text(
                "Let's get started!",
                style: AppTextStyle.title,
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.all(70),
                decoration: const BoxDecoration(
                  color: ColorConst.buttonColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(height: 28),
              PrimaryButton(
                label: "Click here to view details",
                style: AppTextStyle.title.copyWith(color: ColorConst.black),
                onPress: () {},
              ),
              const SizedBox(height: 25),
              Text(
                "History",
                style: AppTextStyle.header1,
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorConst.appBarColor,
                      width: 3,
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: List.generate(
                        16,
                        (index) => BluetoothHistory(
                              onUnpairClick: () {},
                            )).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
