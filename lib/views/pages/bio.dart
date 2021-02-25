import 'package:flutter/material.dart';
import 'package:hero_guide/bloc/hero_bloc.dart';
import 'package:hero_guide/models/heroitem_model.dart';
import 'package:hero_guide/views/components/appearance_widget.dart';
import 'package:hero_guide/views/components/biography_widget.dart';
import 'package:hero_guide/views/widgets/connections_widget.dart';
import 'package:hero_guide/views/components/loader_widget.dart';
import 'package:hero_guide/views/components/powerstats_widget.dart';
import 'package:hero_guide/views/components/work_widget.dart';
import 'package:provider/provider.dart';

class BioPage extends StatefulWidget {
  final HeroItemModel heroItemModel;

  const BioPage({Key key, this.heroItemModel}) : super(key: key);

  @override
  _BioPageState createState() => _BioPageState();
}

class _BioPageState extends State<BioPage> {
  
  @override
  Widget build(BuildContext context) {
    HeroBloc bloc = Provider.of<HeroBloc>(context);
    bloc.statsPerson(widget.heroItemModel);
    
    return Loader(
      object: bloc.statsRace,
      callback: buildTabBar,
    );
  }

  buildTabBar() {
    
    return DefaultTabController(
        length: tabs().length,
        child: Scaffold(
            appBar: AppBar(
              title: Text('${widget.heroItemModel.name}'),
              bottom: TabBar(
                tabs: tabs(),
                isScrollable: true,
              ),
            ),
            body: TabBarView(children: [
              BiographyWidget(),
              AppearanceWidget(),
              PowerStatsWidget(),
              WorkWidget(),
              ConnectionsWidget()
            ])));
  }

  tabs() {
    final list = [
      "Biography",
      "Appearance",
      "Power Stats",
      "Work",
      "Connections",
    ];

    List<Widget> listWidgets = [];

    list.forEach(
      (element) {
        listWidgets.add(
          Tab(
            text: element,
          ),
        );
      },
    );
    return listWidgets;
  }
}
