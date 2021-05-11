import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_task_project/core/base/view/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'standings_page_view_model.g.dart';

class StandingsPageViewModel =_StandingsPageViewModelBase with _$StandingsPageViewModel;

abstract class _StandingsPageViewModelBase with Store, BaseViewModel{
  void setContext(BuildContext context) => this.context = context;
  void init() {
    getOpacity();
  }
  @observable
  bool containerOpacity=false;

  @observable
  bool opacityOn=false;

  @action
  void getOpacity(){
    int repeat=0;

     Timer.periodic(Duration(milliseconds: 100), (Timer timer) async{
         if(repeat==25) containerOpacity=true;
         if(repeat==30) opacityOn=true;
         if(repeat<=50) repeat++;
        });
  }

  @action
  void changeContainerOpacity(){
    containerOpacity=true;
  }

  
}