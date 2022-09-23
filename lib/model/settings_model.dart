class SettingsModel {
  int _longBreakInterval = 4;

  Duration _pomodoroDuration = const Duration(minutes: 25);
  Duration _shortBreakDuration = const Duration(minutes: 5);
  Duration _longBreakDuration = const Duration(minutes: 15);

  bool _isAutoPomodoros = false;
  bool _isAutoBreaks = false;

  SettingsModel();

  int get longBreakInterval => _longBreakInterval;
  set longBreakInterval(int value) => _longBreakInterval = value;

  Duration get pomodoroDuration => _pomodoroDuration;
  set pomodoroDuration(Duration duration) => _pomodoroDuration = duration;

  Duration get shortBreakDuration => _shortBreakDuration;
  set shortBreakDuration(Duration duration) => _shortBreakDuration = duration;

  Duration get longBreakDuration => _longBreakDuration;
  set longBreakDuration(Duration duration) => _longBreakDuration = duration;

  bool get isAutoPomodoros => _isAutoPomodoros;
  set isAutoPomodoros(bool value) => _isAutoPomodoros = value;

  bool get isAutoBreaks => _isAutoBreaks;
  set isAutoBreaks(bool value) => _isAutoBreaks = value;
}
