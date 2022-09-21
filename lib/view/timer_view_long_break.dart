import 'package:flutter/material.dart';
import 'package:pomodoro_app/view/timer_view_pomodoro.dart';
import 'package:provider/provider.dart';
import 'package:pie_timer/pie_timer.dart';

import '../model/timer_model.dart';
import '../view_model/timer_view_model.dart';

import '../provider/theme_provider.dart';

import '../widgets/button_widget.dart';

import 'package:pomodoro_app/constants/colors.dart' as color_constants;
import '../constants/pie_values.dart' as pie_constants;

class TimerViewLongBreak extends StatelessWidget {
  const TimerViewLongBreak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Long Break"),
        backgroundColor: color_constants.purpleDark,
        elevation: 5.0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
              ),
            ),
          )
        ],
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
            duration: const Duration(minutes: 15),
            radius: pie_constants.pieSize,
            pieColor: color_constants.purplePrimary,
            fillColor: color_constants.purpleLight,
            borderWidth: pie_constants.borderWidth,
            borderColor: color_constants.purpleDark,
            shadowElevation: pie_constants.shadowElevation,
            enableTouchControls: pie_constants.touchControls,
            onCompleted: () => print('completed'),
            onDismissed: () => print('dismissed'),
          ),
          ButtonWidget(
            buttonColor: color_constants.purpleDark,
            onPressStop: () => _controller.stopAnim?.call(),
            onPressStart: () => _controller.startAnim?.call(),
            onPressNextPage: () {
              Provider.of<TimerViewModel>(context, listen: false)
                  .nextPage(context);
            },
          ),
        ],
      ),
    );
  }
}
