import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pomodoro_app/provider/appbar_provider.dart';
import 'package:provider/provider.dart';

import './view/timer_view.dart';
import './view_model/timer_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<TimerViewModel>(create: (_) => TimerViewModel()),
      ChangeNotifierProvider<AppBarProvider>(create: (_) => AppBarProvider()),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro'),
        backgroundColor:
            Provider.of<AppBarProvider>(context, listen: true).appBarColor,
        elevation: 5.0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
              ),
            ),
          )
        ],
      ),
      body: const TimerView(),
    );
  }
}
