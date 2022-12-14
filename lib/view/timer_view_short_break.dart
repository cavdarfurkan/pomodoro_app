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

class TimerViewShortBreak extends StatelessWidget {
  const TimerViewShortBreak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Short Break",
        backgroundColor: color_constants.blueDark,
        isSettingsButtonVisible: true,
        bottomTitle:
            "Cycle ${Provider.of<TimerViewModel>(context).model.currentCycle}",
      ),
      backgroundColor: color_constants.bluePrimary,
      body: const ShortBreakBody(),
    );
  }
}

class ShortBreakBody extends StatefulWidget {
  const ShortBreakBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ShortBreakBody> createState() => _ShortBreakBodyState();
}

class _ShortBreakBodyState extends State<ShortBreakBody>
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
    _timerVM = Provider.of<TimerViewModel>(context);
    _settingsVM = context.read<SettingsViewModel>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PieTimer(
            pieAnimationController: _controller,
            duration: _settingsVM.settingsModel.shortBreakDuration,
            radius: timer_constants.pieSize,
            pieColor: color_constants.bluePrimary,
            fillColor: color_constants.blueLight,
            borderWidth: timer_constants.borderWidth,
            borderColor: color_constants.blueDark,
            shadowElevation: timer_constants.shadowElevation,
            enableTouchControls: timer_constants.touchControls,
            onCompleted: () {
              _timerVM.autoStart(
                  context, _settingsVM.settingsModel.isAutoPomodoros);
              if (_settingsVM.settingsModel.isNotification) {
                _notificationService.showNotifications(
                    'Short break is over', 'Back to work');
              }
            },
            onDismissed: () => print('dismissed'),
          ),
          ButtonWidget(
            buttonColor: color_constants.blueDark,
            onPressStop: () => _controller.stopAnim?.call(),
            onPressStart: () => _controller.startAnim?.call(),
            onPressNextPage: () => _timerVM.nextPage(context),
          ),
        ],
      ),
    );
  }
}
