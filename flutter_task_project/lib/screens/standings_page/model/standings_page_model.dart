import 'package:flutter/material.dart';
import 'package:flutter_task_project/core/base/constants/api_names/api_names_model.dart';
import 'package:flutter_task_project/core/base/constants/page_names/page_names_model.dart';
import 'package:flutter_task_project/core/base/constants/strings/strings_model.dart';
import 'package:flutter_task_project/core/base/navigation/navigation_model.dart';
import 'package:flutter_task_project/core/base/network/json_model/get_standings/get_standings_model.dart';
import 'package:flutter_task_project/core/base/network/model/network_model.dart';
import 'package:flutter_task_project/core/init/theme/model/app_themes.dart';
import 'package:flutter_task_project/core/init/theme/model/theme_model.dart';
import 'package:provider/provider.dart';

class StandingsPageModel with ChangeNotifier{
  List<Standing> standings=[];
  Future getStandings(BuildContext context) async{
    List<GetStandingsModel> standingsList= await NetworkModel.getOrPostRequestWithParams(
        context,
        StringsModel.url,
        StringsModel.standingsAddress,
        StringsModel.fixtureParameters,
        StringsModel.fixtureHeaders,
        PageNames.standingsPage,
        ApiNames.getStandings,
        StringsModel.get
    );

    if(standingsList!=null){
      standings=standingsList[0].responseType[0].league.standings[0];

      /**for(int i=0;i<standings.length;i++)
        print("standings[$i].team.name : ${standings[i].team.name}");*/
    }
  }

  void changeThemeAndRestart(BuildContext context, bool isLightOrDark){
    (isLightOrDark==true)
        ? Provider.of<ThemeManager>(context, listen: false).setTheme(AppTheme.light)
        : Provider.of<ThemeManager>(context, listen: false).setTheme(AppTheme.dark);

    NavigationModel.restartApp(context);
  }

}