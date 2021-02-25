import 'package:flutter/material.dart';
import 'package:hero_guide/bloc/hero_bloc.dart';
import 'package:hero_guide/views/widgets/card_circular_indicator_widget.dart';
import 'package:hero_guide/views/widgets/card_stats_details.dart';
import 'package:provider/provider.dart';

class HeaderPowerStats extends StatelessWidget {
  const HeaderPowerStats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HeroBloc bloc = Provider.of<HeroBloc>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CardCircularIndicatorWidget(
                  points: bloc.hero.powerstats.media,
                  title: "Average Skills",
                  media: bloc.statsAll.mediaAll),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardStatsDetails(
                      title: "Comparison between all heroes",
                      length: bloc.statsAll.numberMenbers,
                      position: bloc.ranking,
                      mediaHero: bloc.hero.powerstats.media,
                      mediaStats: bloc.statsAll.mediaAll,
                      average:
                          (((bloc.hero.powerstats.media - bloc.statsAll.mediaAll) /
                                  bloc.statsAll.mediaAll) *
                              100),
                    ),
                    CardStatsDetails(
                      title: "Comparison between the same race",
                      length: bloc.statsRace.numberMenbers,
                      position: bloc.statsRace.ranking,
                      mediaHero: bloc.hero.powerstats.media,
                      mediaStats: bloc.statsRace.mediaAll,
                      average: bloc.statsRace.averageHero,
                    ),
                  ],
                )),
              ))
            ],
          ),
          CardStatsDetails(
                      title: "Comparison between the same gender",
                      length: bloc.statsGender.numberMenbers,
                      position: bloc.statsGender.ranking,
                      mediaHero: bloc.hero.powerstats.media,
                      mediaStats: bloc.statsGender.mediaAll,
                      average: bloc.statsGender.averageHero,
                    ),
                    CardStatsDetails(
                      title: "Comparison between the same race and gender",
                      length: bloc.statsRaceGender.numberMenbers,
                      position: bloc.statsRaceGender.ranking,
                      mediaHero: bloc.hero.powerstats.media,
                      mediaStats: bloc.statsRaceGender.mediaAll,
                      average: bloc.statsRaceGender.averageHero,
                    ),
        ],
      ),
    );
  }
}
