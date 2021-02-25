import 'package:flutter/material.dart';
import 'package:hero_guide/models/percent_indicator_model.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CellTextWidget extends StatelessWidget {
  final String title;
  final dynamic subtitle;

  CellTextWidget({
    Key key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          "${title.toUpperCase()}",
          style: Theme.of(context).textTheme.caption.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        subtitle: subtitleBuild(subtitle, context));
  }

  // ignore: missing_return
  Widget subtitleBuild(dynamic subtitle, BuildContext context) {
    dynamic widgetCustom;
    TextStyle textStyle = Theme.of(context).textTheme.caption.copyWith(
          fontWeight: FontWeight.w300,
        );

    if (subtitle == null) {
      widgetCustom = Text(' - ', style: textStyle);
    }
    if (subtitle is String) {
      widgetCustom = Text(subtitle, style: textStyle);
    }
    if (subtitle is List) {
      widgetCustom = Text(
          subtitle.toString().replaceAll("[", "").replaceAll("]", ""),
          style: textStyle);
    }
    if (subtitle is PercentIndicatorModel) {
      widgetCustom = LinearPercentIndicator(
        animation: subtitle.animation,
        lineHeight: subtitle.lineHeight,
        animationDuration: subtitle.animationDuration,
        percent: subtitle.percent / 100,
        linearStrokeCap: subtitle.linearStrokeCap,
        progressColor: subtitle.progressColor,
        center: Text('${subtitle.percent.toString()}%'),
      );
    }
    return widgetCustom;
  }
}
