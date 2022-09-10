import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import './view/timer_view.dart';
import './view_model/timer_view_model.dart';

void main() {
  runApp(const MyApp());
  debugRepaintRainbowEnabled = true;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TimerViewModel>(
          create: (context) => TimerViewModel(),
        )
      ],
      child: const MaterialApp(
        title: 'Pomodoro App',
        home: MyHomeWidget(),
      ),
    );
  }
}

class MyHomeWidget extends StatelessWidget {
  const MyHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro'),
      ),
      body: const TimerView(),
    );
  }
}
