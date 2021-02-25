import 'package:flutter/material.dart';
import 'package:hero_guide/utils/utils.dart';

class CardStatsDetails extends StatelessWidget {
  const CardStatsDetails({
    Key key,
    this.title,
    this.position,
    this.length,
    this.mediaHero,
    this.mediaStats,
    this.average,
  }) : super(key: key);

  final String title;
  final int position;
  final int length;
  final double mediaHero;
  final double mediaStats;
  final double average;

  @override
  Widget build(BuildContext context) {
    Color colorPoint = verifyColorPoint(
        context: context, media: mediaStats, points: mediaHero);

    TextStyle subtitle2 = Theme.of(context).textTheme.subtitle2;
    TextStyle caption = Theme.of(context).textTheme.caption;
    bool aboveAverage = average >= 0;
    double averageView = aboveAverage ? average : average * -1;

    TextStyle styleHeadline = Theme.of(context)
        .textTheme
        .headline5
        .copyWith(color: colorPoint, fontWeight: FontWeight.w600);

    String ranking = ordinal(position);

    return Container(
      padding: EdgeInsets.only(),
      child: Card(
        color: Colors.white.withOpacity(0.2),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: colorPoint,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                title,
                style: subtitle2.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.bar_chart_outlined,
                        size: 16,
                      ),
                      Column(
                        children: [
                          Text(
                            'Position',
                          ),
                          Text(
                            ranking,
                            style: styleHeadline,
                          ),
                          Text(
                            'of out $length',
                            style: caption,
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    child: VerticalDivider(),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.stacked_line_chart_outlined,
                        size: 16,
                      ),
                      Column(
                        children: [
                          Text(
                            'Average',
                          ),
                          Row(
                            children: [
                              Icon(
                                aboveAverage
                                    ? Icons.arrow_drop_up_outlined
                                    : Icons.arrow_drop_down_outlined,
                                color: colorPoint,
                              ),
                              Text(
                                "${averageView.toStringAsFixed(2)}%",
                                style: styleHeadline,
                              ),
                            ],
                          ),
                          Text(
                            aboveAverage ? 'Above' : 'Bellow',
                            style: caption,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
