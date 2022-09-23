import 'package:flutter/material.dart';
import 'package:pomodoro_app/view/timer_view_pomodoro.dart';

import '../view/settings_view.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.title,
    this.bottomTitle,
    required this.backgroundColor,
    required this.isSettingsButtonVisible,
    this.isBackButtonVisible = false,
  }) : super(key: key);

  final String title;
  final String? bottomTitle;
  final Color backgroundColor;
  final bool isSettingsButtonVisible;
  final bool? isBackButtonVisible;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("$title ${bottomTitle ?? ''}"),
      backgroundColor: backgroundColor,
      elevation: 5.0,
      centerTitle: true,
      leading: isBackButtonVisible == true
          ? IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TimerViewPomodoro(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back),
              tooltip: "Back",
            )
          : null,
      actions: [
        if (isSettingsButtonVisible)
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: IconButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsView(),
                  maintainState: false,
                ),
              ),
              icon: const Icon(Icons.settings),
              tooltip: "Settings",
            ),
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
