import 'package:flutter/material.dart';
import 'package:hero_guide/utils/theme_custom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBloc extends ChangeNotifier {
  AppBloc() {
    checkTheme();
  }

  ThemeData theme = ThemneCustom.darkTheme;
  Key key = UniqueKey();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void setKey(value) {
    key = value;
    notifyListeners();
  }

  void setNavigatorKey(value) {
    navigatorKey = value;
    notifyListeners();
  }

  void setTheme(value, c) {
    theme = value;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("theme", c).then((val) {
        //TODO: alterar para setar os themas disponiveis
      });
    });
    notifyListeners();
  }

  ThemeData getTheme(value) {
    return theme;
  }

  Future<ThemeData> checkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ThemeData themeData;
    String atual = prefs.getString("theme") ?? "light";

    //TODO alterar aqui quando definir os dois temas

    if (atual == "light") {
      themeData = ThemneCustom.darkTheme;
      setTheme(ThemneCustom.darkTheme, "light");
    } else {
      themeData = ThemneCustom.darkTheme;
      setTheme(ThemneCustom.darkTheme, "dark");
    }

    return themeData;
  }
}
