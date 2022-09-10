import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pie_timer/pie_timer.dart';

import '../view_model/timer_view_model.dart';

class TimerView extends StatefulWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView>
    with SingleTickerProviderStateMixin {
  late PieAnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PieAnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerViewModel>(
      builder: (context, model, child) => Column(
        children: [
          if (model.type == PomodoroType.main)
            buildPieTimer(
              _controller,
              model.timerModel.duration,
              model.timerModel.pieColor,
              model.timerModel.fillColor,
            ),
            if (model.type == PomodoroType.go)
            buildPieTimer(
              _controller,
              model.timerModel.duration,
              model.timerModel.pieColor,
              model.timerModel.fillColor,
            ),
            if (model.type == PomodoroType.pause)
            buildPieTimer(
              _controller,
              model.timerModel.duration,
              model.timerModel.pieColor,
              model.timerModel.fillColor,
            ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  _controller.forward();
                  model.onStart();
                },
                child: const Text('Play'),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.stop();
                  model.onStop();
                },
                child: const Text('Stop'),
              ),
            ],
          ),
          Center(
            child: Text('${model.timerModel.duration}'),
          ),
        ],
      ),
    );
  }
}

PieTimer buildPieTimer(PieAnimationController controller, Duration duration,
    Color pieColor, Color fillColor) {
  return PieTimer(
    pieAnimationController: controller,
    duration: duration,
    radius: 150.0,
    pieColor: pieColor,
    fillColor: fillColor,
    borderWidth: 10.0,
    shadowElevation: 10.0,
  );
}
