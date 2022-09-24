import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pie_timer/pie_timer.dart';

import '../view_model/timer_view_model.dart';
import '../view_model/settings_view_model.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/button_widget.dart';

import '../constants/colors.dart' as color_constants;
import '../constants/timer_values.dart' as timer_constants;

class TimerViewPomodoro extends StatelessWidget {
  const TimerViewPomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Pomodoro",
        backgroundColor: color_constants.redDark,
        isSettingsButtonVisible: true,
        bottomTitle:
            "Cycle ${Provider.of<TimerViewModel>(context).model.currentCycle}",
      ),
      backgroundColor: color_constants.redPrimary,
      body: const PomodoroBody(),
    );
  }
}

class PomodoroBody extends StatefulWidget {
  const PomodoroBody({
    Key? key,
  }) : super(key: key);

  @override
  State<PomodoroBody> createState() => _PomodoroBodyState();
}

class _PomodoroBodyState extends State<PomodoroBody>
    with SingleTickerProviderStateMixin {
  late PieAnimationController _controller;
  late SettingsViewModel _settingsVM;
  late TimerViewModel _timerVM;

  @override
  void initState() {
    super.initState();
    _controller = PieAnimationController(vsync: this);

    WidgetsBinding.instance.endOfFrame.then((value) {
      if (mounted) afterBuild(context);
    });
  }

  void afterBuild(BuildContext context) {
    if (_settingsVM.settingsModel.isAutoPomodoros) {
      _controller.startAnim?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    _settingsVM = Provider.of<SettingsViewModel>(context);
    _timerVM = Provider.of<TimerViewModel>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PieTimer(
            pieAnimationController: _controller,
            duration: Provider.of<SettingsViewModel>(context)
                .settingsModel
                .pomodoroDuration,
            radius: timer_constants.pieSize,
            pieColor: color_constants.redPrimary,
            fillColor: color_constants.redLight,
            borderWidth: timer_constants.borderWidth,
            borderColor: color_constants.redDark,
            shadowElevation: timer_constants.shadowElevation,
            enableTouchControls: timer_constants.touchControls,
            onCompleted: () => _timerVM.autoStart(
                context, _settingsVM.settingsModel.isAutoBreaks),
            onDismissed: () => print('dismissed'),
          ),
          ButtonWidget(
            buttonColor: color_constants.redDark,
            onPressStop: () => _controller.stopAnim?.call(),
            onPressStart: () => _controller.startAnim?.call(),
            onPressNextPage: () => _timerVM.nextPage(context),
          ),
        ],
      ),
    );
  }
}
