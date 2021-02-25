import 'package:flutter/material.dart';
import 'package:hero_guide/bloc/hero_bloc.dart';
import 'package:provider/provider.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HeroBloc bloc = Provider.of<HeroBloc>(context);
    return Container(
      child: new Wrap(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Filter Gender',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.black54),
              ),
            ),
          ),
          ListTile(
              selectedTileColor: Colors.black12,
              selected: bloc.genderFilter == "female",
              leading:
                  bloc.genderFilter == "female" ? Icon(Icons.check) : SizedBox(),
              title: new Text('female'),
              onTap: () => {
                    bloc.setFilter(
                        gender: bloc.genderFilter == "female" ? null : "female",
                        aligment: bloc.aligmentFilter),
                    Navigator.pop(context)
                  }),
          ListTile(
            selectedTileColor: Colors.black12,
              selected: bloc.genderFilter == "male",
            leading:
                bloc.genderFilter == "male" ? Icon(Icons.check) : SizedBox(),
            title: new Text('male'),
            onTap: () => {
              bloc.setFilter(
                  gender: bloc.genderFilter == "male" ? null : "male",
                  aligment: bloc.aligmentFilter),
              Navigator.pop(context)
            },
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Filter Alignment',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.black54),
              ),
            ),
          ),
          ListTile(
              selectedTileColor: Colors.black12,
              selected: bloc.aligmentFilter == "bad",
              leading:
                  bloc.aligmentFilter == "bad" ? Icon(Icons.check) : SizedBox(),
              title: new Text('Bad'),
              onTap: () => {
                    bloc.setFilter(
                        gender: bloc.genderFilter,
                        aligment: bloc.aligmentFilter == "bad" ? null : "bad"),
                    Navigator.pop(context)
                  }),
          ListTile(
            selectedTileColor: Colors.black12,
            selected: bloc.aligmentFilter == "good",
            leading:
                bloc.aligmentFilter == "good" ? Icon(Icons.check) : SizedBox(),
            title: new Text('Good'),
            onTap: () => {
              bloc.setFilter(
                  gender: bloc.genderFilter,
                  aligment: bloc.aligmentFilter == "good" ? null : "good"),
              Navigator.pop(context)
            },
          ),
        ],
      ),
    );
  }
}