import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PercentIndicatorModel {
  bool animation;
  double lineHeight;
  int animationDuration;
  double percent;
  LinearStrokeCap linearStrokeCap;
  Color progressColor;

  PercentIndicatorModel({
    @required this.percent,
    @required this.progressColor,
    this.animation = true,
    this.lineHeight = 25.0,
    this.animationDuration = 1500,
    this.linearStrokeCap = LinearStrokeCap.roundAll,
  });
}
