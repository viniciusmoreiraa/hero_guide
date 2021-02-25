import 'package:flutter/material.dart';
import 'package:hero_guide/bloc/hero_bloc.dart';
import 'package:hero_guide/views/widgets/cell_text_widget.dart';
import 'package:hero_guide/views/widgets/avatar_hero_widget.dart';
import 'package:provider/provider.dart';

class BiographyWidget extends StatelessWidget {
  

  const BiographyWidget({
    Key key,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HeroBloc bloc = Provider.of<HeroBloc>(context);
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      child: Column(children: <Widget>[
        Hero(
          tag: bloc.hero.id,
          child: AvatarHero(
            img: bloc.hero.images.md,
          ),
        ),
        SizedBox(
          height: 13.0,
        ),
        Text(
          bloc.hero.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          bloc.hero.biography.fullName.isEmpty
              ? bloc.hero.name
              : bloc.hero.biography.fullName,
          style: Theme.of(context).textTheme.subtitle2.copyWith(
                fontWeight: FontWeight.w300,
              ),
        ),
        Column(
          children: <Widget>[
            CellTextWidget(
              title: 'Alter Ego(s)',
              subtitle: bloc.hero.biography.alterEgos,
            ),
            CellTextWidget(
              title: "Aliases",
              subtitle: bloc.hero.biography.aliases,
            ),
            CellTextWidget(
              title: "Place of birth",
              subtitle: bloc.hero.biography.placeOfBirth,
            ),
            CellTextWidget(
              title: "First Appearance",
              subtitle: bloc.hero.biography.firstAppearance,
            ),
            CellTextWidget(
              title: "Creator",
              subtitle: bloc.hero.biography.publisher,
            ),
            CellTextWidget(
              title: "Alignment",
              subtitle: bloc.hero.biography.alignment,
            )
          ],
        ),
      ]),
    ));
  }
}
