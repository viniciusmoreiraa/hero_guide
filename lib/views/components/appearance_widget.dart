import 'package:flutter/material.dart';
import 'package:hero_guide/bloc/hero_bloc.dart';
import 'package:hero_guide/views/widgets/cell_text_widget.dart';
import 'package:provider/provider.dart';

class AppearanceWidget extends StatelessWidget {
  

  const AppearanceWidget({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HeroBloc bloc = Provider.of<HeroBloc>(context);
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Hero(
                tag: bloc.hero.id,
                child: Image.network(
                  bloc.hero.images.md,
                  height: 400,
                ),
              ),
              SizedBox(
                height: 13.0,
              ),
              Column(
                children: <Widget>[
                  CellTextWidget(
                    title: 'Gender',
                    subtitle: bloc.hero.appearance.gender,
                  ),
                  CellTextWidget(
                    title: "Race",
                    subtitle: bloc.hero.appearance.race,
                  ),
                  CellTextWidget(
                    title: "Height",
                    subtitle: bloc.hero.appearance.height,
                  ),
                  CellTextWidget(
                    title: "Weight",
                    subtitle: bloc.hero.appearance.weight,
                  ),
                  CellTextWidget(
                    title: "Eye Color",
                    subtitle: bloc.hero.appearance.eyeColor,
                  ),
                  CellTextWidget(
                    title: "Hair Color",
                    subtitle: bloc.hero.appearance.hairColor,
                  ),
                ],
              ),
            ])));
  }
}
