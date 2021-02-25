import 'package:flutter/material.dart';
import 'package:hero_guide/models/heroitem_model.dart';
import 'package:hero_guide/models/media_stats_model.dart';
import 'package:hero_guide/repositories/hero_repository.dart';

class HeroBloc extends ChangeNotifier {
  final heroRepository = new AllHeroRepository();

  HeroBloc() {
    heroGetAll();
  }

  List<HeroItemModel> listHeroItem;
  List<HeroItemModel> searchList;
  HeroItemModel hero;
  int ranking;
  int numberHeroes = 0;
  int numbersHuman = 0;
  int nMulheres = 0;
  int nHomens = 0;
  int nOutros = 0;
  MediaStatsrModel statsAll;
  MediaStatsrModel statsRace;
  MediaStatsrModel statsGender;
  MediaStatsrModel statsRaceGender;
  MediaStatsrModel statsBad;
  MediaStatsrModel statsGood;
  String aligmentFilter;
  String genderFilter;
  bool withFilter;
  

  void setFilter({String aligment, String gender}) {
    this.aligmentFilter = aligment;
    this.genderFilter = gender;
    heroSearch(aligment: aligment, gender: gender);
    this.withFilter =
        (this.aligmentFilter != null || this.genderFilter != null);
    notifyListeners();
  }

  void heroSearch({String text = '', String aligment, String gender}) {
    List<HeroItemModel> listGeneric = [];
    this.searchList = [];

    if (text == null || text == '' && aligment == null && gender == null) {
      this.searchList.addAll(listHeroItem);
    } else {
      this.searchList = this
          .listHeroItem
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()) ||
              element.biography.fullName
                  .toLowerCase()
                  .contains(text.toLowerCase()))
          .toList();

      listGeneric.addAll(this.searchList);

      if (aligment != null) {
        this.searchList = listGeneric
            .where((element) => (element.biography.alignment != null &&
                element.biography.alignment.toLowerCase() ==
                    aligment.toLowerCase()))
            .toList();
      }
      if (gender != null) {
        listGeneric = this.searchList;
        this.searchList = listGeneric
            .where((element) => (element.appearance.gender != null &&
                element.appearance.gender.toLowerCase() ==
                    gender.toLowerCase()))
            .toList();
      }
    }
  }

  void heroGetAll() async {
    await heroRepository.getHero(endPoint: "all.json").then((value) async {
      this.listHeroItem = value;
      this.statsAll = getStats(this.listHeroItem);
      heroSearch();
      notifyListeners();
    });
  }

  void setHeroItem(HeroItemModel select) {
    this.hero = select;
    statsPerson(select);
    this.ranking = getRanking(hero, this.listHeroItem);
    print('bloc setado ${this.hero.name} ${this.ranking}');
  }

  void statsPerson(HeroItemModel hero) async {
    List<HeroItemModel> listGenericRace = [];
    List<HeroItemModel> listGenericGender = [];
    List<HeroItemModel> listGenericGenderRace = [];

    listHeroItem.forEach((element) {
      if (element.appearance.race != null &&
          element.appearance.race == hero.appearance.race) {
        listGenericRace.add(element);
      }
      if (element.appearance.gender != null &&
          element.appearance.gender == hero.appearance.gender) {
        listGenericGender.add(element);
      }
      if (element.appearance.gender == hero.appearance.gender &&
          element.appearance.race == hero.appearance.race) {
        listGenericGenderRace.add(element);
      }
    });
    this.statsGender = getStats(listGenericGender);
    this.statsRace = getStats(listGenericRace);
    this.statsRaceGender = getStats(listGenericGenderRace);
  }

  int getRanking(HeroItemModel hero, List<HeroItemModel> list) {
    List<HeroItemModel> listGeneric = [];
    listGeneric.addAll(list);
    int index;
    listGeneric
        .sort((a, b) => b.powerstats.media.compareTo(a.powerstats.media));
    index = listGeneric.lastIndexOf(hero);
    return index +1 ;
  }

  MediaStatsrModel getStats(List<HeroItemModel> list, {HeroItemModel hero}) {
    int listLength = list.length;
    double combat = 0;
    double durability = 0;
    double intelligence = 0;
    double power = 0;
    double speed = 0;
    double strength = 0;
    double mediaCombat = 0;
    double mediaDurability = 0;
    double mediaIntelligence = 0;
    double mediaPower = 0;
    double mediaSpeed = 0;
    double mediaStrength = 0;
    double mediaAll = 0;
    int ranking = 0;
    double averageComparacaoHero = 0;

    list.forEach((element) {
      combat += element.powerstats.combat;
      durability += element.powerstats.durability;
      intelligence += element.powerstats.intelligence;
      power += element.powerstats.power;
      speed += element.powerstats.speed;
      strength += element.powerstats.strength;
    });
    mediaCombat = (combat / listLength);
    mediaDurability = (durability / listLength);
    mediaIntelligence = (intelligence / listLength);
    mediaPower = (power / listLength);
    mediaSpeed = (speed / listLength);
    mediaStrength = (strength / listLength);
    mediaAll = ((mediaCombat +
            mediaDurability +
            mediaIntelligence +
            mediaPower +
            mediaSpeed +
            mediaStrength) /
        6);
    if (this.hero != null) {
      ranking = getRanking(this.hero, list);
      averageComparacaoHero = (((this.hero.powerstats.media - mediaAll) / mediaAll) * 100);
    }

    

    MediaStatsrModel mediaStats = new MediaStatsrModel(
      mediaCombat: mediaCombat,
      mediaAll: mediaAll,
      mediaDurability: mediaDurability,
      mediaIntelligence: mediaIntelligence,
      mediaPower: mediaPower,
      mediaSpeed: mediaSpeed,
      mediaStrength: mediaStrength,
      numberMenbers: listLength,
      ranking: ranking,
      averageHero: averageComparacaoHero,
    );
    return mediaStats;
  }
}
