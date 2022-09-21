import 'package:flutter/material.dart';

import '../model/timer_model.dart';

import '../view/timer_view_pomodoro.dart';
import '../view/timer_view_short_break.dart';
import '../view/timer_view_long_break.dart';

class TimerViewModel {
  TimerViewModel();

  TimerModel model = TimerModel(longBreakInterval: 4);
  int cycleCounter = 1;

  void nextPage(BuildContext context) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, animation, secondaryAnimation) {
          if (cycleCounter != 4) {
            if (context.widget.toString() == 'PomodoroBody') {
              return const TimerViewShortBreak();
            } else {
              incrementCycle();
              debugPrint("${cycleCounter}");
              return const TimerViewPomodoro();
            }
          } else {
            resetCycle();
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

  void incrementCycle() {
    cycleCounter++;
  }

  void resetCycle() {
    cycleCounter = 0;
  }
}
