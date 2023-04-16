import 'package:herculas_bluetooth_connectivity/base/base_bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class RangeBloc extends BaseBloc {
  final rangeCounter = BehaviorSubject<int>.seeded(0);
  final isHistoryEnable = BehaviorSubject<bool>.seeded(false);

  int _counter = 0;

  void incrementRange() {
    _counter++;
    rangeCounter.add(_counter);
  }

  void decrementRange() {
    if (rangeCounter.valueOrNull! > 0) {
      _counter--;
      rangeCounter.add(_counter);
    }
  }
}
