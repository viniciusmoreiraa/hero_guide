
import 'package:dio/dio.dart';
import 'package:hero_guide/models/heroitem_model.dart';
import 'package:hero_guide/utils/settings.dart';

class AllHeroRepository {
  Future<List<HeroItemModel>> getHero({String endPoint = "all.json"}) async {
    List<HeroItemModel> listRetorno = [];
    var url = "${Settings.apiUrlDev}$endPoint";
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      
      response.data.forEach((element) {
        listRetorno.add(HeroItemModel.fromJson(element));
      });
    }
    return listRetorno;
  }
}
