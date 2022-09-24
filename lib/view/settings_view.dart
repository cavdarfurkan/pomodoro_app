import 'package:flutter/material.dart';
import 'package:pomodoro_app/widgets/list_tile_widget.dart';
import 'package:provider/provider.dart';

import '../view_model/settings_view_model.dart';

import '../widgets/app_bar_widget.dart';

import '../constants/colors.dart' as color_constants;

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: 'Settings',
        backgroundColor: color_constants.grayDark,
        isSettingsButtonVisible: false,
        isBackButtonVisible: true,
      ),
      backgroundColor: color_constants.grayPrimary,
      body: SettingsBody(),
    );
  }
}

class SettingsBody extends StatelessWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsViewModel viewModel = Provider.of<SettingsViewModel>(context);

    return ListView(
      padding: const EdgeInsets.only(top: 10.0),
      children: [
        ListTileWidget(
          title: "Durations (Minutes)",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () => viewModel.showDurationDialog(
                  context: context,
                  title: 'Pomodoro Duration',
                  tag: 'pomodoroDuration',
                  minusFunction: () => viewModel.minusPomodoroDuration(),
                  plusFunction: () => viewModel.plusPomodoroDuration(),
                ),
                child: Text(viewModel.settingsModel.pomodoroDuration.inMinutes
                    .toString()),
              ),
              OutlinedButton(
                onPressed: () => viewModel.showDurationDialog(
                  context: context,
                  title: 'Short Break Duration',
                  tag: 'shortBreakDuration',
                  minusFunction: () => viewModel.minusShortBreakDuration(),
                  plusFunction: () => viewModel.plusShortBreakDuration(),
                ),
                child: Text(viewModel.settingsModel.shortBreakDuration.inMinutes
                    .toString()),
              ),
              OutlinedButton(
                onPressed: () => viewModel.showDurationDialog(
                  context: context,
                  title: 'Long Break Duration',
                  tag: 'longBreakDuration',
                  minusFunction: () => viewModel.minusLongBreakDuration(),
                  plusFunction: () => viewModel.plusLongBreakDuration(),
                ),
                child: Text(viewModel.settingsModel.longBreakDuration.inMinutes
                    .toString()),
              ),
            ],
          ),
        ),
        ListTileWidget(
          title: 'Long Break Interval',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => viewModel.minusLongBreakInterval(),
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text(viewModel.settingsModel.longBreakInterval.toString()),
              IconButton(
                onPressed: () => viewModel.plusLongBreakInterval(),
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
        ),
        ListTileWidget(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Flexible(
                fit: FlexFit.tight,
                child: Text('Auto Start Pomodoros', textAlign: TextAlign.start),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Switch(
                  value: viewModel.settingsModel.isAutoPomodoros,
                  onChanged: (v) => viewModel.switchAutoPomodoros(v),
                ),
              ),
            ],
          ),
        ),
        ListTileWidget(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Flexible(
                fit: FlexFit.tight,
                child: Text('Auto Start Breaks', textAlign: TextAlign.start),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Switch(
                  value: viewModel.settingsModel.isAutoBreaks,
                  onChanged: (v) => viewModel.switchAutoBreaks(v),
                ),
              ),
            ],
          ),
        ),
        ListTileWidget(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Flexible(
                fit: FlexFit.tight,
                child: Text('Notifications', textAlign: TextAlign.start),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Switch(
                  value: viewModel.settingsModel.isNotification,
                  onChanged: (v) => viewModel.switchNotification(v),
                ),
              ),
            ],
          ),
        ),
        ListTileWidget(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Flexible(
                  fit: FlexFit.tight,
                  child: Text("Reset To Defaults", textAlign: TextAlign.start)),
              Flexible(
                fit: FlexFit.loose,
                child: OutlinedButton(
                  onPressed: () => viewModel.resetToDefaults(),
                  child: const Text('Reset'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
