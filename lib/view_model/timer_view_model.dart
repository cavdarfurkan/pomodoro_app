import 'package:flutter/material.dart';
import '../model/timer_model.dart';

enum PomodoroType { main, go, shortBreak, longBreak, pause }

class TimerViewModel extends ChangeNotifier {
  late PomodoroType type = PomodoroType.main;
  late TimerModel timerModel;
  bool vis1 = true;
  bool vis2 = false;

  TimerViewModel() {
    _buildModel();
  }

  void _buildModel() {
    if (type == PomodoroType.main) {
      timerModel = const TimerModel(
        duration: Duration(seconds: 10),
        radius: 100.0,
        pieColor: Colors.blueAccent,
        fillColor: Colors.red,
      );
    }
    if (type == PomodoroType.go) {
      timerModel = const TimerModel(
        duration: Duration(minutes: 25),
        radius: 100.0,
        pieColor: Colors.blueAccent,
        fillColor: Colors.yellow,
      );
    }
    if (type == PomodoroType.shortBreak) {
      timerModel = const TimerModel(
        duration: Duration(minutes: 5),
        radius: 100.0,
        pieColor: Colors.blueAccent,
        fillColor: Colors.white,
      );
    }
    if (type == PomodoroType.longBreak) {
      timerModel = const TimerModel(
        duration: Duration(minutes: 15),
        radius: 100.0,
        pieColor: Colors.blueAccent,
        fillColor: Colors.green,
      );
    }
    if (type == PomodoroType.pause) {
      timerModel = TimerModel(
        duration: const Duration(seconds: 50),
        radius: 100.0,
        pieColor: Colors.grey[400]!,
        fillColor: Colors.grey,
      );
    }
  }

  void changeVisibility() {
    vis1 = !vis1;
    vis2 = !vis2;
    nextModel();
  }

  void nextModel() {
    int i = type.index;
    int n = i + 1;
    if (i == PomodoroType.values.length - 1) {
      n = 0;
    }
    type = PomodoroType.values.elementAt(n);
    _buildModel();
    notifyListeners();
  }

}
