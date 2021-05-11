
import 'package:flutter_task_project/core/init/theme/dark_theme/dark_theme.dart';
import 'package:flutter_task_project/core/init/theme/light_theme/light_theme.dart';

enum AppTheme{light, dark}

final appThemeData={
  AppTheme.light:lightTheme,
  AppTheme.dark:darkTheme,
};