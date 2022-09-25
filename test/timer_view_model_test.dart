import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_app/view_model/timer_view_model.dart';
import 'package:pomodoro_app/view_model/settings_view_model.dart';

void main() {
  group('Cycle Testing', () {
    test('current cycle', () {
      TimerViewModel timerViewModel = TimerViewModel();
      expect(timerViewModel.model.currentCycle, 1);
    });

    test('long break interval', () {
      SettingsViewModel settingsViewModel = SettingsViewModel();
      expect(settingsViewModel.settingsModel.longBreakInterval, 4);
    });
  });
}
