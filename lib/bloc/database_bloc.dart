import 'package:rxdart/subjects.dart';

class DatabaseBloc {
  final databaseCounter = BehaviorSubject<int>.seeded(0);
  final isHistoryEnable = BehaviorSubject<bool>.seeded(false);

  int _counter = 0;

  void incrementRange() {
    _counter++;
    databaseCounter.add(_counter);
  }

  void decrementRange() {
    if (databaseCounter.valueOrNull! > 0) {
      _counter--;
      databaseCounter.add(_counter);
    }
  }
}
