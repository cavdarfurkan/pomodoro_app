import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/timer_model.dart';
import '../view_model/settings_view_model.dart';

import '../view/timer_view_pomodoro.dart';
import '../view/timer_view_short_break.dart';
import '../view/timer_view_long_break.dart';

class TimerViewModel {
  TimerModel model = TimerModel();
  int cycleCounter = 1;

  late int longBreakInterval;

  TimerViewModel();

  void nextPage(BuildContext context) {
    longBreakInterval =
        context.read<SettingsViewModel>().settingsModel.longBreakInterval;

    if (longBreakInterval < cycleCounter) resetCycleCounter();

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, animation, secondaryAnimation) {
          if (cycleCounter != longBreakInterval) {
            if (context.widget.toString() == 'PomodoroBody') {
              return const TimerViewShortBreak();
            } else {
              _incrementCycleCounter();
              return const TimerViewPomodoro();
            }
          } else {
            resetCycleCounter();
            return const TimerViewLongBreak();
          }
        },
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (_, animation, __, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.fastLinearToSlowEaseIn;

          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  void autoStart(BuildContext context, bool isAutoStart) {
    if (isAutoStart) {
      nextPage(context);
    }
  }

  void _incrementCycleCounter() {
    cycleCounter++;
    _incrementCurrentCycle();
  }

  void resetCycleCounter() {
    cycleCounter = 0;
  }

  void _incrementCurrentCycle() {
    model.currentCycle++;
  }
}
