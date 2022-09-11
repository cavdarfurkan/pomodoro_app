import 'package:flutter/material.dart';
import '../model/timer_model.dart';

class TimerViewModel extends ChangeNotifier {
  late List<TimerModel> listTimerModel = [
    mainModel,
    goModel,
    shortBreakModel,
    longBreakModel,
  ];

  late TimerModel mainModel;
  late TimerModel goModel;
  late TimerModel shortBreakModel;
  late TimerModel longBreakModel;

  TimerViewModel() {
    _buildModel();
  }

  void _buildModel() {
    mainModel = const TimerModel(
      duration: Duration(seconds: 10),
      radius: 100.0,
      pieColor: Colors.blueAccent,
      fillColor: Colors.red,
    );
    goModel = const TimerModel(
      duration: Duration(minutes: 25),
      radius: 100.0,
      pieColor: Colors.blueAccent,
      fillColor: Colors.yellow,
    );
    shortBreakModel = const TimerModel(
      duration: Duration(minutes: 5),
      radius: 100.0,
      pieColor: Colors.blueAccent,
      fillColor: Colors.white,
    );
    longBreakModel = const TimerModel(
      duration: Duration(minutes: 15),
      radius: 100.0,
      pieColor: Colors.blueAccent,
      fillColor: Colors.green,
    );
  }
}
