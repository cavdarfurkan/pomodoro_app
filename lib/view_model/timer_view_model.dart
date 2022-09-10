import 'package:flutter/material.dart';
import '../model/timer_model.dart';

enum PomodoroType { main, go, shortBreak, longBreak, pause }

class TimerViewModel with ChangeNotifier {
  PomodoroType type = PomodoroType.main;
  late TimerModel timerModel;

  // late TimerModel mainModel;
  // late TimerModel goModel;
  // late TimerModel shortBreakModel;
  // late TimerModel longBreakModel;
  // late TimerModel pauseModel;

  TimerViewModel() {
    _buildModel();
  }

  void _buildModel() {
    if (type == PomodoroType.main) {
      debugPrint("main");
      timerModel = const TimerModel(
        duration: Duration(seconds: 10),
        radius: 100.0,
        pieColor: Colors.blueAccent,
        fillColor: Colors.red,
      );
    }
    if (type == PomodoroType.go) {
      debugPrint("go");
      timerModel = const TimerModel(
        duration: Duration(minutes: 25),
        radius: 100.0,
        pieColor: Colors.blueAccent,
        fillColor: Colors.yellow,
      );
    }

    if (type == PomodoroType.shortBreak) {
      debugPrint("short");
      timerModel = const TimerModel(
        duration: Duration(minutes: 5),
        radius: 100.0,
        pieColor: Colors.blueAccent,
        fillColor: Colors.red,
      );
    }

    if (type == PomodoroType.longBreak) {
      debugPrint("long");
      timerModel = const TimerModel(
        duration: Duration(minutes: 15),
        radius: 100.0,
        pieColor: Colors.blueAccent,
        fillColor: Colors.red,
      );
    }

    if (type == PomodoroType.pause) {
      debugPrint("pause");
      timerModel = TimerModel(
        duration: const Duration(seconds: 50),
        radius: 100.0,
        pieColor: Colors.grey[400]!,
        fillColor: Colors.grey,
      );
    }

    notifyListeners();
  }

  void onStart() {
    type = PomodoroType.go;
    _buildModel();
  }

  void onStop() {
    type = PomodoroType.pause;
    _buildModel();
  }
}
