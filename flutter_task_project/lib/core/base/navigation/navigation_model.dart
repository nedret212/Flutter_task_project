import 'package:flutter/material.dart';
import 'package:flutter_task_project/screens/standings_page/view/standings_page_view.dart';
import 'package:page_transition/page_transition.dart';

class NavigationModel{
  static void pageTransitionWithAnimate(BuildContext context, Widget page, {bool latePop, int waitSecond, bool isOldAlertPopped})async{
    if(latePop==true) await Future.delayed(Duration(seconds: waitSecond), () {});
    if(isOldAlertPopped==true) Navigator.of(context).pop();
    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: page));
  }
  static void restartApp(context){
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => StandingsPageView(),
        ), (Route<dynamic> route) => false);
  }
}