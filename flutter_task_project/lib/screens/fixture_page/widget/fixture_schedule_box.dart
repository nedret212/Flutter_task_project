import 'package:flutter/material.dart';
import 'package:flutter_task_project/screens/fixture_page/model/fixture_page_model.dart';

class FixtureScheduleBox extends StatelessWidget {
  Game game;
  Color color=Colors.white.withOpacity(0.9);

  FixtureScheduleBox({this.game});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: [
          homeTeam(),
          score(),
          awayTeam(),
        ],
      ),
    );
  }

  Widget homeTeam(){
    return Expanded(
      flex:7,
      child: Row(
          children: [
            Expanded(
              flex:1,
              child: Opacity( opacity: 0.5, child: Image.network(game.homeTeam.logoUrl),),
            ),
            SizedBox(width: 4,),
            Expanded(
              flex:4,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(game.homeTeam.teamName,
                  style: TextStyle(
                    fontWeight: (game.homeTeam.isWin==true) ? FontWeight.w800 : FontWeight.w400,
                    fontSize: 15,
                    color: color,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
    );
  }
  Widget awayTeam(){
    return Expanded(
      flex:7,
      child: Row(
        children: [
          Expanded(
            flex:4,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(game.awayTeam.teamName,
                style: TextStyle(
                  fontWeight: (game.awayTeam.isWin==true) ? FontWeight.w800 : FontWeight.w400,
                  fontSize: 15,
                  color: (game.awayTeam.isWin==true) ? color : Colors.white70,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          SizedBox(width: 4,),
          Expanded(
            flex:1,
            child: Opacity( opacity: 0.5, child: Image.network(game.awayTeam.logoUrl),),
          ),
        ],
      ),
    );
  }
  Widget score(){
    return Expanded(
      flex:2,
      child: Row(
        children: [
          Expanded(
            flex:2,
            child: Text(game.homeTeam.score, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: color),),
          ),
          Expanded(
            flex:1,
            child: Text("-", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: color),),
          ),
          Expanded(
            flex:2,
            child: Text(game.awayTeam.score, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: color),),
          ),
        ],
      ),
    );
  }
}