import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_task_project/core/base/view/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'fixture_page_view_model.g.dart';

class FixturePageViewModel =_FixturePageViewModelBase with _$FixturePageViewModel;

abstract class _FixturePageViewModelBase with Store, BaseViewModel{
  void setContext(BuildContext context) => this.context = context;

  void init() {
    getOpacity();
  }

  @observable
  String footerText="1st Week";

  int pageIndex=1;
  @action
  void changeIndex(int index){
    index++;
    if(index==1) footerText="1st Week";
    else if(index==2) footerText="2nd Week";
    else if(index==3) footerText="3rd Week";
    else  footerText="${index}th Week";
  }

  @observable
  bool containerOpacity=false;

  @action
  void getOpacity(){
    int repeat=0;

    Timer.periodic(Duration(milliseconds: 100), (Timer timer) async{
      if(repeat==25) containerOpacity=true;
      if(repeat<=50) repeat++;
    });
  }

  @action
  void changeContainerOpacity(){
    containerOpacity=true;
  }
}