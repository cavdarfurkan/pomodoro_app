import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pie_timer/pie_timer.dart';

import '../view_model/timer_view_model.dart';

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<TimerViewModel>(
          builder: (context, model, child) => Column(
            children: [
              Visibility(
                visible: model.vis1,
                maintainState: false,
                child: _buildPieWidget(model),
              ),
              Visibility(
                visible: model.vis2,
                maintainState: false,
                child: _buildPieWidget(model),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => model.changeVisibility(),
                      child: const Text('Next'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

PieTimer _buildPieWidget(TimerViewModel model) {
  return PieTimer(
    duration: model.timerModel.duration,
    radius: 150.0,
    pieColor: model.timerModel.pieColor,
    fillColor: model.timerModel.fillColor,
    borderWidth: 10.0,
    borderColor: Colors.white,
    shadowElevation: 10.0,
    enableTouchControls: true,
  );
}