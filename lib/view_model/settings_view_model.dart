import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/settings_model.dart';

class SettingsViewModel extends ChangeNotifier {
  late SettingsModel settingsModel;

  SettingsViewModel() {
    settingsModel = SettingsModel();
  }

  void minusPomodoroDuration() {
    settingsModel.pomodoroDuration <= Duration.zero
        ? 0
        : settingsModel.pomodoroDuration -= const Duration(minutes: 1);
    notifyListeners();
  }

  void plusPomodoroDuration() {
    settingsModel.pomodoroDuration =
        settingsModel.pomodoroDuration + const Duration(minutes: 1);
    notifyListeners();
  }

  void minusShortBreakDuration() {
    settingsModel.shortBreakDuration <= Duration.zero
        ? 0
        : settingsModel.shortBreakDuration -= const Duration(minutes: 1);
    notifyListeners();
  }

  void plusShortBreakDuration() {
    settingsModel.shortBreakDuration =
        settingsModel.shortBreakDuration + const Duration(minutes: 1);
    notifyListeners();
  }

  void minusLongBreakDuration() {
    settingsModel.longBreakDuration <= Duration.zero
        ? 0
        : settingsModel.longBreakDuration -= const Duration(minutes: 1);
    notifyListeners();
  }

  void plusLongBreakDuration() {
    settingsModel.longBreakDuration =
        settingsModel.longBreakDuration + const Duration(minutes: 1);
    notifyListeners();
  }

  void minusLongBreakInterval() {
    settingsModel.longBreakInterval <= 1
        ? 1
        : settingsModel.longBreakInterval -= 1;
    notifyListeners();
  }

  void plusLongBreakInterval() {
    settingsModel.longBreakInterval += 1;
    notifyListeners();
  }

  void switchAutoPomodoros(bool value) {
    settingsModel.isAutoPomodoros = value;
    notifyListeners();
  }

  void switchAutoBreaks(bool value) {
    settingsModel.isAutoBreaks = value;
    notifyListeners();
  }

  void switchNotification(bool value) {
    settingsModel.isNotification = value;
    notifyListeners();
  }

  Future<dynamic> showDurationDialog({
    required BuildContext context,
    required String title,
    required String tag,
    required VoidCallback minusFunction,
    required VoidCallback plusFunction,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        late final Duration duration;
        if (tag == "pomodoroDuration") {
          duration = Provider.of<SettingsViewModel>(context)
              .settingsModel
              .pomodoroDuration;
        } else if (tag == "shortBreakDuration") {
          duration = Provider.of<SettingsViewModel>(context)
              .settingsModel
              .shortBreakDuration;
        } else {
          duration = Provider.of<SettingsViewModel>(context)
              .settingsModel
              .longBreakDuration;
        }

        return AlertDialog(
          title: Text(title),
          content: Wrap(
            alignment: WrapAlignment.spaceAround,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  minusFunction.call();
                },
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text(duration.inMinutes.toString()),
              IconButton(
                onPressed: () => plusFunction.call(),
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  void resetToDefaults() {
    settingsModel.longBreakInterval = 4;

    settingsModel.pomodoroDuration = const Duration(minutes: 25);
    settingsModel.shortBreakDuration = const Duration(minutes: 5);
    settingsModel.longBreakDuration = const Duration(minutes: 15);

    settingsModel.isAutoPomodoros = false;
    settingsModel.isAutoBreaks = false;
    settingsModel.isNotification = true;

    notifyListeners();
  }
}
