import 'package:flutter/material.dart';
import 'package:pomodoro_app/view/settings_view.dart';
import 'package:pomodoro_app/view/timer_view_long_break.dart';
import 'package:pomodoro_app/view/timer_view_pomodoro.dart';
import 'package:pomodoro_app/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:pie_timer/pie_timer.dart';

import '../model/timer_model.dart';
import '../view_model/timer_view_model.dart';

import '../provider/theme_provider.dart';

import '../widgets/button_widget.dart';

import '../constants/colors.dart' as color_constants;
import '../constants/pie_values.dart' as pie_constants;

class TimerViewShortBreak extends StatelessWidget {
  const TimerViewShortBreak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return const Scaffold(
      appBar: AppBarWidget(
        title: "Short Break",
        backgroundColor: color_constants.blueDark,
      ),
      backgroundColor: color_constants.bluePrimary,
      body: ShortBreakBody(),
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
            duration: const Duration(minutes: 5),
            radius: pie_constants.pieSize,
            pieColor: color_constants.bluePrimary,
            fillColor: color_constants.blueLight,
            borderWidth: pie_constants.borderWidth,
            borderColor: color_constants.blueDark,
            shadowElevation: pie_constants.shadowElevation,
            enableTouchControls: pie_constants.touchControls,
            onCompleted: () => print('completed'),
            onDismissed: () => print('dismissed'),
          ),
          ButtonWidget(
            buttonColor: color_constants.blueDark,
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
