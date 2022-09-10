import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pomodoro_app/main.dart';
import 'package:pomodoro_app/view_model/timer_view_model.dart';

void main() {
  test("Enum Type", () {
    final timer_vm = TimerViewModel();
    expect(timer_vm.type, PomodoroType.go);
  });
}
