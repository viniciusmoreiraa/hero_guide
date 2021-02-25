import 'package:flutter/material.dart';
import 'package:hero_guide/utils/utils.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CardCircularIndicatorWidget extends StatelessWidget {
  const CardCircularIndicatorWidget({
    Key key,
    @required this.points,
    @required this.title,
    this.media,
  }) : super(key: key);

  final double points;
  final String title;
  final double media;

  @override
  Widget build(BuildContext context) {
    Color colorVerifycation =
        verifyColorPoint(points: points, media: media, context: context);
    double percent = (((points - media) / media) * 100);
    return Card(
      color: Colors.white.withOpacity(0.2),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(
          color: colorVerifycation,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: CircularPercentIndicator(
          animation: true,
          animationDuration: 1500,
          radius: 120.0,
          lineWidth: 10.0,
          percent: points / 100,
          header: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              title,
              style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          footer: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "${points.toStringAsFixed(2)} of 100 points",
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontWeight: FontWeight.w300),
                ),
                Text(
                  "${percent.toStringAsFixed(2)}% ${percent >= 0 ? 'above average' : 'below average'}",
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          center: Icon(
            Icons.bolt,
            size: 50.0,
            color: colorVerifycation,
          ),
          progressColor: colorVerifycation,
        ),
      ),
    );
  }

  
}
