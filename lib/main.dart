import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pomodoro_app/view_model/settings_view_model.dart';
import 'package:provider/provider.dart';

import '../view_model/timer_view_model.dart';
import '../view/timer_view_pomodoro.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<TimerViewModel>(create: (_) => TimerViewModel()),
        ChangeNotifierProvider<SettingsViewModel>(
            create: (_) => SettingsViewModel()),
      ],
      child: const MyApp(),
    ),
  );
  debugRepaintRainbowEnabled = false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pomodoro App',
      home: MyHomeWidget(),
    );
  }
}

class MyHomeWidget extends StatelessWidget {
  const MyHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TimerViewPomodoro();
  }
}
