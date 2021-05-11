import 'package:flutter/material.dart';
import 'package:flutter_task_project/core/base/constants/api_names/api_names_model.dart';
import 'package:flutter_task_project/core/base/constants/page_names/page_names_model.dart';
import 'package:flutter_task_project/core/base/constants/strings/strings_model.dart';
import 'package:flutter_task_project/core/base/network/json_model/get_fixture/get_fixture_model.dart';
import 'package:flutter_task_project/core/base/network/model/network_model.dart';

class FixturePageModel with ChangeNotifier{
  List<Game> matchList=[];
  bool isFixtureReady=false;

  Future getFixtures(BuildContext context) async{
    List<GetFixtureModel> fixtureList= await NetworkModel.getOrPostRequestWithParams(
        context,
        StringsModel.url,
        StringsModel.fixtureAddress,
        StringsModel.fixtureParameters,
        StringsModel.fixtureHeaders,
        PageNames.fixturePage,
        ApiNames.getFixture,
        StringsModel.get
    );

    getWeeklyFixture(fixtureList);
  }

  void getWeeklyFixture(List<GetFixtureModel> fixtureList){
    matchList.clear();
    for(int i=0;i<38;i++){
      for(int j=0;j<10;j++){
        TeamItems homeTeam= TeamItems(
          teamName: fixtureList[0].response[(i*10)+j].teams.home.name,
          logoUrl: fixtureList[0].response[(i*10)+j].teams.home.logo,
          score: fixtureList[0].response[(i*10)+j].goals.home.toString(),
          isWin: fixtureList[0].response[(i*10)+j].teams.home.winner,
        );
        TeamItems awayTeam= TeamItems(
          teamName: fixtureList[0].response[(i*10)+j].teams.away.name,
          logoUrl: fixtureList[0].response[(i*10)+j].teams.away.logo,
          score: fixtureList[0].response[(i*10)+j].goals.away.toString(),
          isWin: fixtureList[0].response[(i*10)+j].teams.away.winner,
        );
        Game game= Game(
          homeTeam: homeTeam,
          awayTeam: awayTeam
        );
        matchList.add(game);
      }
    }
    isFixtureReady=true;
    notifyListeners();
  }
}


class TeamItems{
  String teamName;
  String logoUrl;
  String score;
  bool isWin;

  TeamItems({this.teamName, this.logoUrl, this.score, this.isWin});
}

class Game{
  TeamItems homeTeam;
  TeamItems awayTeam;

  Game({this.homeTeam, this.awayTeam});
}