import 'package:flutter/material.dart';

class TimerModel {
  final Duration duration;
  final double radius;
  final Color pieColor;
  final Color fillColor;
  final Color appBarColor;

  const TimerModel({
    required this.duration,
    required this.radius,
    required this.pieColor,
    required this.fillColor,
    required this.appBarColor
  });
}
