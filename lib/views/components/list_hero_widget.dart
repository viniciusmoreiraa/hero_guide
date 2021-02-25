import 'package:flutter/material.dart';
import 'package:hero_guide/bloc/hero_bloc.dart';
import 'package:hero_guide/models/heroitem_model.dart';
import 'package:hero_guide/views/components/loader_widget.dart';
import 'package:hero_guide/views/widgets/hero_card_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ListHeroWidget extends StatelessWidget {
  
  List<HeroItemModel> listHeroItem;
  double medialAll;

  @override
  Widget build(BuildContext context) {
    HeroBloc bloc = Provider.of<HeroBloc>(context);
    listHeroItem = bloc.searchList;
    medialAll = bloc.statsAll?.mediaAll ?? 0;

    return Loader(object: bloc.searchList, callback: buildListView);
  }

  buildListView() {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: listHeroItem.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: HeroCard(
            heroItemModel: listHeroItem[index],
            medialAll: medialAll,
          ),
        );
      },
    );
  }
}
