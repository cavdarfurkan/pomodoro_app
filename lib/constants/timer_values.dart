import 'dart:ui';

import 'package:flutter/material.dart';

// final double width =
//     (MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width /
//             12) *
//         4;

final double width =
    MediaQueryData.fromView(PlatformDispatcher.instance.views.first)
            .size
            .width /
        12 *
        4;

final double pieSize = width;
const double borderWidth = 15.0;
const double shadowElevation = 5.0;
const bool touchControls = true;

final double iconSize = width / 2;
