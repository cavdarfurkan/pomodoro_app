import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pie_timer/pie_timer.dart';

import '../view_model/timer_view_model.dart';
import 'package:pomodoro_app/temp/app_scroll_behavior.dart'; //Temp

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: 0);
    return Consumer<TimerViewModel>(
      builder: (context, model, child) => PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        scrollBehavior: AppScrollBehaviour(),
        onPageChanged: (value) => debugPrint('$value'),
        children: [
          for (var pies in _pieWidget(model)) pies,
        ],
      ),
    );
  }
}

List<Widget> _pieWidget(TimerViewModel model) {
  List<Widget> listPieTimer = List.empty(growable: true);

  for (var m in model.listTimerModel) {
    listPieTimer.add(Center(
      child: Column(
        children: [
          PieTimer(
            duration: m.duration,
            radius: 150.0,
            pieColor: m.pieColor,
            fillColor: m.fillColor,
            borderWidth: 10.0,
            borderColor: Colors.white,
            shadowElevation: 5.0,
            enableTouchControls: true,
          ),
          ElevatedButton(onPressed: () {}, child: Text("qwe")),
        ],
      ),
    ));
  }

  return listPieTimer;
}
