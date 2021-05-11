import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_task_project/core/base/constants/constants.dart';
import 'package:flutter_task_project/core/base/constants/strings/strings_model.dart';
import 'package:flutter_task_project/core/base/view/base_view.dart';
import 'package:flutter_task_project/core/init/theme/model/theme_model.dart';
import 'package:flutter_task_project/screens/fixture_page/model/fixture_page_model.dart';
import 'package:flutter_task_project/screens/fixture_page/view_model/fixture_page_view_model.dart';
import 'package:flutter_task_project/screens/fixture_page/widget/fixture_schedule_box.dart';
import 'package:provider/provider.dart';

class FixturePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeManager>(create: (context) => ThemeManager()),
          ChangeNotifierProvider<FixturePageModel>(create: (context) => FixturePageModel()),
        ],
        child: Consumer2<ThemeManager, FixturePageModel>(builder: (context, theme, model, child) {
          return BaseView<FixturePageViewModel>(
            viewModel: FixturePageViewModel(),
            onModelReady: (viewModel) async{
              viewModel.setContext(context);
              viewModel.init();

              await model.getFixtures(context);
            },
            onPageBuilder: (BuildContext context, FixturePageViewModel viewModel) {
              return Scaffold(
                body: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage((isLightOrDark==true) ? Constants.standingsLightBackground : Constants.standingsDarkBackground),
                      fit: BoxFit.cover,
                    ),
                  ),
                  //color: theme.themeData.primaryColorDark,
                  child: Column(
                      children: [
                        title(),
                        body(viewModel, model, height, width),
                        footer(viewModel),
                      ],
                  ),
                ),
              );
            },
          );
        }));
  }
  Widget title(){
    return Expanded(
      flex:1,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          StringsModel.fixtures,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: (isLightOrDark==true) ? Colors.deepPurple.shade800 : Colors.deepOrange),
        ),
      ),
    );
  }
  Widget body(FixturePageViewModel viewModel, FixturePageModel model, double height, double width){
    return Expanded(
      flex: 5,
      child: Observer(
        builder: (context)=>
            AnimatedOpacity(
              opacity:  (viewModel.containerOpacity==false) ? 0 : 0.8 ,
              duration: Duration(milliseconds: 500),
              child: CarouselSlider.builder(
                itemCount: 38,
                options: CarouselOptions(
                    height: height*0.75,
                    aspectRatio: 1,
                    viewportFraction: 0.85,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      viewModel.changeIndex(index);
                    }
                ),
                itemBuilder: (ctx, index, realIdx) {
                  return Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.5),
                      color:  (isLightOrDark==true) ? Colors.deepPurple.shade800 : Colors.deepOrange,
                    ),
                    width: width,
                    child: (model.isFixtureReady==true) ? AnimatedOpacity(
                      opacity: (model.isFixtureReady==true) ? 1 : 0,
                      duration: Duration(milliseconds: 500),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, lbIndex){
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FixtureScheduleBox(game: model.matchList[index*10+lbIndex],),
                              SizedBox(height: 16),
                            ],
                          );
                        },
                      ),
                    ): Container(),
                  );
                },
              ),
            ),
      ),
    );
  }
  Widget footer(FixturePageViewModel viewModel){
    return Expanded(
      flex:1,
      child: Observer(
        builder: (context)=>
            Align(
              alignment: Alignment.center,
              child: Text(
                viewModel.footerText,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: (isLightOrDark==true) ? Colors.deepPurple.shade800 : Colors.deepOrange),
              ),
            ),
      ),
    );
  }
}
