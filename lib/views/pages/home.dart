import 'package:flutter/material.dart';
import 'package:hero_guide/bloc/hero_bloc.dart';
import 'package:hero_guide/utils/settings.dart';
import 'package:hero_guide/views/components/filter_bottom_sheet.widget.dart';
import 'package:hero_guide/views/components/list_hero_widget.dart';
import 'package:hero_guide/views/widgets/custom_appbar_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    HeroBloc bloc = Provider.of<HeroBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('${Settings.nameApp}'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              bloc.heroSearch(
                  aligment: bloc.aligmentFilter, gender: bloc.genderFilter);
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
          IconButton(
              icon: Icon(bloc.withFilter == null || bloc.withFilter == false
                  ? Icons.filter_alt_outlined
                  : Icons.filter_alt),
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return FilterBottomSheet();
                    });
              })
        ],
      ),
      body: ListHeroWidget(),
    );
  }
}


