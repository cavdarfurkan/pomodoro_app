import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pie_timer/pie_timer.dart';

import '../services/notification_service.dart';

import '../view_model/timer_view_model.dart';
import '../view_model/settings_view_model.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/button_widget.dart';

import '../constants/colors.dart' as color_constants;
import '../constants/timer_values.dart' as timer_constants;

class TimerViewLongBreak extends StatelessWidget {
  const TimerViewLongBreak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Long Break",
        backgroundColor: color_constants.purpleDark,
        isSettingsButtonVisible: true,
        bottomTitle:
            "Cycle ${Provider.of<TimerViewModel>(context).model.currentCycle}",
      ),
      backgroundColor: color_constants.purplePrimary,
      body: const LongBreakBody(),
    );
  }
}

class LongBreakBody extends StatefulWidget {
  const LongBreakBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LongBreakBody> createState() => _LongBreakBodyState();
}

class _LongBreakBodyState extends State<LongBreakBody>
    with SingleTickerProviderStateMixin {
  late PieAnimationController _controller;
  late TimerViewModel _timerVM;
  late SettingsViewModel _settingsVM;

  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _controller = PieAnimationController(vsync: this);

    WidgetsBinding.instance.endOfFrame.then((value) {
      if (mounted) afterBuild(context);
    });
  }

  void afterBuild(BuildContext context) {
    if (_settingsVM.settingsModel.isAutoBreaks) _controller.startAnim?.call();
  }

  @override
  Widget build(BuildContext context) {
    _settingsVM = context.read<SettingsViewModel>();
    _timerVM = Provider.of<TimerViewModel>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PieTimer(
            pieAnimationController: _controller,
            duration: _settingsVM.settingsModel.longBreakDuration,
            radius: timer_constants.pieSize,
            pieColor: color_constants.purplePrimary,
            fillColor: color_constants.purpleLight,
            borderWidth: timer_constants.borderWidth,
            borderColor: color_constants.purpleDark,
            shadowElevation: timer_constants.shadowElevation,
            enableTouchControls: timer_constants.touchControls,
            onCompleted: () {
              _timerVM.autoStart(
                  context, _settingsVM.settingsModel.isAutoPomodoros);
              if (_settingsVM.settingsModel.isNotification) {
                _notificationService.showNotifications(
                    'Long break is over', 'Back to work');
              }
            },
            onDismissed: () => print('dismissed'),
          ),
          ButtonWidget(
            buttonColor: color_constants.purpleDark,
            onPressStop: () => _controller.stopAnim?.call(),
            onPressStart: () => _controller.startAnim?.call(),
            onPressNextPage: () {
              _timerVM.nextPage(context);
            },
          ),
        ],
      ),
    );
  }
}
