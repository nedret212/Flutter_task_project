import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_task_project/core/base/constants/constants.dart';
import 'package:flutter_task_project/core/base/constants/strings/strings_model.dart';
import 'package:flutter_task_project/core/base/navigation/navigation_model.dart';
import 'package:flutter_task_project/core/base/view/base_view.dart';
import 'package:flutter_task_project/core/init/theme/model/theme_model.dart';
import 'package:flutter_task_project/screens/fixture_page/view/fixture_page_view.dart';
import 'package:flutter_task_project/screens/standings_page/model/standings_page_model.dart';
import 'package:flutter_task_project/screens/standings_page/view_model/standings_page_view_model.dart';
import 'package:flutter_task_project/screens/standings_page/widgets/standings_schedule_box.dart';
import 'package:provider/provider.dart';

class StandingsPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeManager>(
              create: (context) => ThemeManager()),
          ChangeNotifierProvider<StandingsPageModel>(
              create: (context) => StandingsPageModel()),
        ],
        child: Consumer2<ThemeManager, StandingsPageModel>(
            builder: (context, theme, model, child) {
              return BaseView<StandingsPageViewModel>(
                viewModel: StandingsPageViewModel(),
                onModelReady: (viewModel) {
                  viewModel.setContext(context);
                  viewModel.init();

                  model.getStandings(context);
                },
                onPageBuilder: (BuildContext context, StandingsPageViewModel viewModel) {
                    return Scaffold(
                      body: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage((isLightOrDark==true) ? Constants.standingsLightBackground : Constants.standingsDarkBackground),
                            fit: BoxFit.cover,
                          ),
                        ),
                        //color: theme.themeData.primaryColorDark,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              title(),
                              body(viewModel, model, width),
                              footer(context, model),
                            ],
                          ),
                        ),
                      ),
                    );},
              );
            }));
  }

  Widget title(){
    return Expanded(
      flex:3,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          StringsModel.standings,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: (isLightOrDark==true) ? Colors.deepPurple.shade800 : Colors.deepOrange),
        ),
      ),
    );
  }
  Widget body(StandingsPageViewModel viewModel, StandingsPageModel model, double width){
    return Expanded(
      flex:15,
      child: Observer(
        builder: (context)=>
            AnimatedOpacity(
              opacity:  (viewModel.containerOpacity==false) ? 0 : 0.85 ,
              duration: Duration(milliseconds: 500),
              child: Container(
                width: width*0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.5),
                  color:  (isLightOrDark==true) ? Colors.deepPurple.shade800 : Colors.deepOrange,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                  child: Column(
                    children: [
                      Observer(
                        builder: (context)=>
                            AnimatedOpacity(
                              opacity: (viewModel.opacityOn==true) ? 1: 0,
                              duration: Duration(milliseconds: 500),
                              child: StandingsScheduleBox(
                                teamName: "Team",
                                game: "M",
                                win: "W",
                                draw: "D",
                                lose: "L",
                                points: "Point",
                                indexOff: true,
                              ),
                            ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: model.standings.length,
                        itemBuilder: (context, index){
                          return Column(
                            children: [
                              Observer(
                               builder: (context)=>
                                   AnimatedOpacity(
                                     opacity: (viewModel.opacityOn==true) ? 1 : 0,
                                     duration: Duration(milliseconds: 500),
                                     child: StandingsScheduleBox(
                                       index: index+1,
                                       teamName: model.standings[index].team.name,
                                       win: model.standings[index].all.win.toString(),
                                       draw: model.standings[index].all.draw.toString(),
                                       lose: model.standings[index].all.lose.toString(),
                                       points: model.standings[index].points.toString(),
                                     ),
                                   ),
                              ),
                              SizedBox(height: 3,),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
  Widget footer(BuildContext context, StandingsPageModel model){
    return Expanded(
      flex:2,
      child: Row(
        children: [
          Expanded(
            flex:2,
            child: Row(
              children: [
                TextButton(
                  onPressed: ()=>model.changeThemeAndRestart(context, true),
                  child: Text(
                    "Light",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.deepPurple.shade800,),
                  ),
                ),
                TextButton(
                  onPressed: ()=>model.changeThemeAndRestart(context, false),
                  child: Text(
                    "Dark",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color:  Colors.deepOrange),),
                ),
              ],
            ),
          ),
          Expanded(
            flex:1,
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: ()=>NavigationModel.pageTransitionWithAnimate(context, FixturePageView()),
                child: Text(
                  "Get Fixtures",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: (isLightOrDark==true) ? Colors.deepPurple.shade800 : Colors.deepOrange),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}