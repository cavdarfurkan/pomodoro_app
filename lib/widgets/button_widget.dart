import 'package:flutter/material.dart';

import '../constants/colors.dart' as color_constants;
import '../constants/timer_values.dart' as timer_constants;

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.buttonColor,
    required this.onPressStop,
    required this.onPressStart,
    required this.onPressNextPage,
  }) : super(key: key);

  final Color buttonColor;
  final VoidCallback onPressStop;
  final VoidCallback onPressStart;
  final VoidCallback onPressNextPage;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        IconButton(
          onPressed: () => onPressStop(),
          iconSize: timer_constants.iconSize,
          icon: Icon(
            Icons.stop_rounded,
            color: buttonColor,
            size: timer_constants.iconSize,
            shadows: [
              BoxShadow(
                blurRadius: 1.0,
                offset: const Offset(0, 5.0),
                color: color_constants.shadowColor,
              ),
            ],
          ),
          splashRadius: timer_constants.iconSize / 2,
          tooltip: "Stop",
        ),
        IconButton(
          onPressed: () => onPressStart(),
          iconSize: timer_constants.iconSize * 2,
          icon: Icon(
            Icons.play_arrow_rounded,
            color: buttonColor,
            size: timer_constants.iconSize * 2,
            shadows: [
              BoxShadow(
                blurRadius: 1.0,
                offset: const Offset(0, 5.0),
                color: color_constants.shadowColor,
              ),
            ],
          ),
          splashRadius: timer_constants.iconSize,
          tooltip: "Start",
        ),
        IconButton(
          onPressed: () => onPressNextPage(),
          iconSize: timer_constants.iconSize,
          icon: Icon(
            Icons.skip_next_rounded,
            color: buttonColor,
            size: timer_constants.iconSize,
            shadows: [
              BoxShadow(
                blurRadius: 1.0,
                offset: const Offset(0, 5.0),
                color: color_constants.shadowColor,
              ),
            ],
          ),
          splashRadius: timer_constants.iconSize / 2,
          tooltip: "Next",
        ),
      ],
    );
  }
}
