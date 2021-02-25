import 'package:flutter/material.dart';
import 'package:hero_guide/bloc/hero_bloc.dart';

import 'package:hero_guide/views/widgets/cell_text_widget.dart';
import 'package:provider/provider.dart';

class WorkWidget extends StatelessWidget {
  const WorkWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HeroBloc bloc = Provider.of<HeroBloc>(context);
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              CellTextWidget(
                title: 'Base',
                subtitle: bloc.hero.work.base,
              ),
              CellTextWidget(
                title: "Occupation",
                subtitle: bloc.hero.work.occupation,
              ),
            ])));
  }
}
