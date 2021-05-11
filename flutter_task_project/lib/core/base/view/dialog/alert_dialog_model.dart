import 'package:flutter/material.dart';

class AlertDialogModel {
  static void warning(BuildContext context, String description, String statusCode,
      {IconData alertIcon, Color colorTheme, bool isCodeSeen, bool barrierDismiss, bool dotOff}){
    showDialog(context: context,
        barrierDismissible: (barrierDismiss!=false) ? true  : false,
        builder: (context){
          return  Container(
            child: AlertDialog(
              //backgroundColor: Globals.iFollowWhite,
              elevation: 40,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Expanded(
                      flex:1,
                      child: Icon((alertIcon==null)
                          ? Icons.warning_amber_rounded
                          : alertIcon,color:(colorTheme==null) ? Colors.blue :  colorTheme,size:32)),
                  Expanded(
                    flex:4,
                    child: Text(
                      (isCodeSeen==false)
                          ? (dotOff==true) ? "$description" : "$description."
                          : "$description. Code : $statusCode",
                      style: TextStyle(color:(colorTheme==null) ? Colors.blue : null),textAlign: TextAlign.center,),),
                ],
              ),
            ),
          );
        });
  }
}