import 'package:flutter/material.dart';
import 'package:hero_guide/bloc/hero_bloc.dart';
import 'package:hero_guide/models/percent_indicator_model.dart';
import 'package:hero_guide/views/widgets/cell_text_widget.dart';
import 'package:hero_guide/views/components/header_power_stats.dart';
import 'package:provider/provider.dart';

class PowerStatsWidget extends StatelessWidget {
  const PowerStatsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HeroBloc bloc = Provider.of<HeroBloc>(context);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderPowerStats(),
          CellTextWidget(
            title: "Intelligence",
            subtitle: PercentIndicatorModel(
              percent: bloc.hero.powerstats.intelligence.toDouble(),
              progressColor: Colors.blueAccent,
            ),
          ),
          CellTextWidget(
            title: "Power",
            subtitle: PercentIndicatorModel(
              percent: bloc.hero.powerstats.power.toDouble(),
              progressColor: Colors.red,
            ),
          ),
          CellTextWidget(
            title: "Combat",
            subtitle: PercentIndicatorModel(
              percent: bloc.hero.powerstats.combat.toDouble(),
              progressColor: Colors.purple,
            ),
          ),
          CellTextWidget(
            title: "Strength",
            subtitle: PercentIndicatorModel(
              percent: bloc.hero.powerstats.strength.toDouble(),
              progressColor: Colors.orangeAccent,
            ),
          ),
          CellTextWidget(
            title: "Speed",
            subtitle: PercentIndicatorModel(
              percent: bloc.hero.powerstats.speed.toDouble(),
              progressColor: Colors.cyan,
            ),
          ),
          CellTextWidget(
            title: "Durability",
            subtitle: PercentIndicatorModel(
              percent: bloc.hero.powerstats.durability.toDouble(),
              progressColor: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
