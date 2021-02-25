import 'package:flutter/material.dart';
import 'package:hero_guide/bloc/hero_bloc.dart';
import 'package:hero_guide/views/components/list_hero_widget.dart';
import 'package:hero_guide/views/components/loader_widget.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate();
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    HeroBloc bloc = Provider.of<HeroBloc>(context);
    bloc.heroSearch(
        text: query, aligment: bloc.aligmentFilter, gender: bloc.genderFilter);

    return Loader(object: bloc.searchList, callback: _buildSearchList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    HeroBloc bloc = Provider.of<HeroBloc>(context);
    bloc.heroSearch(
        text: query, aligment: bloc.aligmentFilter, gender: bloc.genderFilter);
    return Loader(object: bloc.searchList, callback: _buildSearchList);
  }

  _buildSearchList() {
    return ListHeroWidget();
  }
}
