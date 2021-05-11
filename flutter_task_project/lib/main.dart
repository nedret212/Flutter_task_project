import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task_project/core/base/constants/page_names/page_names_model.dart';
import 'package:flutter_task_project/core/base/constants/strings/strings_model.dart';
import 'package:flutter_task_project/core/init/theme/dark_theme/dark_theme.dart';
import 'package:flutter_task_project/core/init/theme/model/app_themes.dart';
import 'package:flutter_task_project/core/init/theme/model/theme_model.dart';
import 'package:flutter_task_project/screens/fixture_page/view/fixture_page_view.dart';
import 'package:flutter_task_project/screens/standings_page/view/standings_page_view.dart';
import 'package:provider/provider.dart';

void main()async{
  ///SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp(),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeManager>(create: (context) => ThemeManager()),
      ],
      child: Consumer<ThemeManager>(builder: (context, theme, child) {
        return MaterialApp(
          theme: theme.themeData,
          title: StringsModel.highlightTitle,
          initialRoute: PageNames.standingsPage,
          darkTheme: theme.themeData,
          routes: {
            PageNames.standingsPage: (context)=> StandingsPageView(),
            PageNames.fixturePage: (context) => FixturePageView(),
          },
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
