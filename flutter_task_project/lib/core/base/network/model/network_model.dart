import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_project/core/base/constants/api_names/api_names_model.dart';
import 'package:flutter_task_project/core/base/constants/page_names/page_names_model.dart';
import 'package:flutter_task_project/core/base/network/json_model/get_fixture/get_fixture_model.dart';
import 'package:flutter_task_project/core/base/network/json_model/get_standings/get_standings_model.dart';
import 'package:flutter_task_project/core/base/view/dialog/alert_dialog_model.dart';

class NetworkModel{
  static Future getOrPostRequestWithParams(
      final BuildContext context,
      final url,
      final address,
      final Map<String, dynamic> params,
      final Map<String, dynamic> headers,
      final pageName,
      final apiName,
      String getOrPost
      ) async {

    final baseOptions=BaseOptions(
        baseUrl: url,
        queryParameters:params,
        headers: headers,
        responseType: ResponseType.plain
    );

    final _dioClient = Dio(baseOptions);

    Response response;
    if(getOrPost=="get")  response=await _dioClient.get(address);
    else if(getOrPost=="post")  response=await _dioClient.post(address);

    if(response.statusCode==200){
      if(pageName==PageNames.fixturePage){
        if(apiName==ApiNames.getFixture){
          String responseBody=response.data.toString();
          responseBody="[$responseBody]";

          List<dynamic> data = jsonDecode(responseBody);
          List<GetFixtureModel> fixtureList = data.map((data) => GetFixtureModel.fromJson(data)).toList();
         /** print("getOrPostRequestWithParams/FixturePage/getFixture'den gelen parametreler: "
              ": fixtureList[0].response[0].fixture.referee : ${fixtureList[0].response[0].fixture.referee}");*/

          return fixtureList;
        }
    } else if(pageName==PageNames.standingsPage){
        if(apiName==ApiNames.getStandings){
          ///printResponse(response);
          String responseBody=response.data.toString();
          responseBody="[$responseBody]";

          List<dynamic> data = jsonDecode(responseBody);
          List<GetStandingsModel> standingsList = data.map((data) => GetStandingsModel.fromJson(data)).toList();
           /**print("getOrPostRequestWithParams/StandingsPage/getStandings'den gelen parametreler: "
              "standingsList[0].responseType[0].league.standings[0][0].team.name : ${standingsList[0].responseType[0].league.standings[0][0].team.name}");*/

          return standingsList;
        }
      }else AlertDialogModel.warning(context, response.statusMessage, response.statusCode.toString());
    }
  }

  static void printResponse(Response response){
    print("response.body: ${response.data}");
    print("response.statusCode: ${response.statusCode}");
    print("response.statusMessage: ${response.statusMessage}");
  }
}