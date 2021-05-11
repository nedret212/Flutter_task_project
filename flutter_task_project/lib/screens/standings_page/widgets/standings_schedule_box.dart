import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class StandingsScheduleBox extends StatelessWidget {
  String teamName, win, draw, lose, game, points;
  int index;
  bool indexOff=false;
  Color color=Colors.white.withOpacity(0.9);


  StandingsScheduleBox({this.index, this.teamName, this.game="38", this.win, this.draw, this.lose, this.points, this.indexOff});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: [
          Expanded(
            flex:5,
            child: (indexOff==true)
                ? Text(teamName, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color),)
                :  Row(
              children: [
                Expanded(
                  flex:2,
                  child: Text("$index.", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: color),),
                ),
                Expanded(
                  flex:13,
                  child: Text(teamName, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: color),),
                ),
              ],
            ),
          ),
          Expanded(
            flex:1,
            child: Text(game, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: color),
            ),
          ),
          Expanded(
            flex:1,
            child: Text(win, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: color),
            ),
          ),
          Expanded(
            flex:1,
            child: Text(draw, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: color),
            ),
          ),
          Expanded(
            flex:1,
            child: Text(lose, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: color),
            ),
          ),
          Expanded(
            flex:1,
            child: Align(
              alignment: Alignment.centerRight,
              child: AutoSizeText(points, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: color), maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
