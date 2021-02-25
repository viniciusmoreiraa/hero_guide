import 'package:flutter/material.dart';
import 'package:hero_guide/bloc/hero_bloc.dart';
import 'package:hero_guide/models/heroitem_model.dart';
import 'package:hero_guide/views/pages/bio.dart';

import 'package:hero_guide/views/widgets/avatar_hero_widget.dart';
import 'package:provider/provider.dart';

class HeroCard extends StatelessWidget {
  final HeroItemModel heroItemModel;
  final double medialAll;

  HeroCard({
    Key key,
    @required this.heroItemModel,
    this.medialAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double percent;
    percent =
        (((heroItemModel.powerstats.media - medialAll) / medialAll) * 100);

    return InkWell(
      onTap: () {
        HeroBloc bloc = Provider.of<HeroBloc>(context, listen: false);
        bloc.setHeroItem(heroItemModel);
        var router = new MaterialPageRoute(
          builder: (BuildContext context) {
            return BioPage(
              heroItemModel: heroItemModel,
            );
          },
        );

        Navigator.of(context).push(router);
      },
      child: Card(
        color: Colors.white.withOpacity(0.2),
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(
            color: Theme.of(context).accentColor,
            width: 2.0,
          ),
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 8.0,
                  ),
                  Hero(
                    tag: heroItemModel.id,
                    child: AvatarHero(img: heroItemModel.images.sm),
                  ),
                  Container(
                    width: 16.0,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${heroItemModel.name}",
                            style: textTheme.headline6,
                          ),
                          Text(
                            heroItemModel.biography.fullName.isEmpty
                                ? heroItemModel.name
                                : heroItemModel.biography.fullName,
                            style: textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.corporate_fare_outlined,
                                size: 18.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Flexible(
                                child: Text(
                                  "${heroItemModel.biography.publisher}",
                                  style: textTheme.caption,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.bolt,
                                size: 18.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Flexible(
                                child: Text(
                                  "${heroItemModel.powerstats.media.toStringAsFixed(2)} of 100 in Power ",
                                  style: textTheme.caption,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.stacked_line_chart_outlined,
                                size: 18.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Flexible(
                                child: Text(
                                  "${percent.toStringAsFixed(2)}% ${percent >= 0 ? 'above average' : 'below average'}",
                                  style: textTheme.caption,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.perm_identity_outlined,
                                size: 18.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Flexible(
                                child: Text(
                                  "${(heroItemModel.appearance.race ?? 'NA')}",
                                  style: textTheme.caption,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Icon(Icons.chevron_right_outlined),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
