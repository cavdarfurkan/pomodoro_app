import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import './view/timer_view.dart';
import './view_model/timer_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<TimerViewModel>(create: (_) => TimerViewModel()),
    ],
    child: const MyApp(),
  ));
  debugRepaintRainbowEnabled = false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pomodoro App',
      home: MyHomeWidget(),
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
