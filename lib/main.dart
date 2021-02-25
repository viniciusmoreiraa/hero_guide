import 'package:flutter/material.dart';
import 'package:hero_guide/bloc/hero_bloc.dart';
import 'package:hero_guide/utils/settings.dart';
import 'package:hero_guide/utils/theme_custom.dart';
import 'package:hero_guide/views/pages/home.dart';
import 'package:provider/provider.dart';

import 'bloc/app_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider<AppBloc>.value(
          value: AppBloc(),
        ),
        ChangeNotifierProvider<HeroBloc>.value(
          value: HeroBloc(),
        ),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO alterar qndo escolher temas
    AppBloc appBloc = Provider.of<AppBloc>(context);
    return MaterialApp(
      key: appBloc.key,
      debugShowCheckedModeBanner: false,
      navigatorKey: appBloc.navigatorKey,
      title: Settings.nameApp,
      theme: appBloc.theme,
      darkTheme: ThemneCustom.darkTheme,
      home: Home(),
    );
  }
}
