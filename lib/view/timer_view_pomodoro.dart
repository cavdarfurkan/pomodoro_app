import 'package:flutter/material.dart';
import 'package:pomodoro_app/view/settings_view.dart';
import 'package:pomodoro_app/view/timer_view_short_break.dart';
import 'package:provider/provider.dart';
import 'package:pie_timer/pie_timer.dart';

import '../model/timer_model.dart';
import '../view_model/timer_view_model.dart';

import '../provider/theme_provider.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/button_widget.dart';

import '../constants/colors.dart' as color_constants;
import '../constants/pie_values.dart' as pie_constants;

class TimerViewPomodoro extends StatelessWidget {
  const TimerViewPomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return const Scaffold(
      appBar: AppBarWidget(
        title: "Pomodoro",
        backgroundColor: color_constants.redDark,
      ),
      backgroundColor: color_constants.redPrimary,
      body: PomodoroBody(),
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

  @override
  void initState() {
    super.initState();
    _controller = PieAnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PieTimer(
            pieAnimationController: _controller,
            duration: const Duration(minutes: 25),
            radius: pie_constants.pieSize,
            pieColor: color_constants.redPrimary,
            fillColor: color_constants.redLight,
            borderWidth: pie_constants.borderWidth,
            borderColor: color_constants.redDark,
            shadowElevation: pie_constants.shadowElevation,
            enableTouchControls: pie_constants.touchControls,
            onCompleted: () => print('completed'),
            onDismissed: () => print('dismissed'),
          ),
          ButtonWidget(
            buttonColor: color_constants.redDark,
            onPressStop: () => _controller.stopAnim?.call(),
            onPressStart: () => _controller.startAnim?.call(),
            onPressNextPage: () =>
                Provider.of<TimerViewModel>(context, listen: false)
                    .nextPage(context),
          ),
        ],
      ),
    );
  }
}
