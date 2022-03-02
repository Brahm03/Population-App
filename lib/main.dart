import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:appexample/core/components/app_theme.dart';
import 'package:appexample/routes/my_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final MyRoutes _myRoutes = MyRoutes();
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: APPTHEME.ligth,
        dark: APPTHEME.dark,
        initial: AdaptiveThemeMode.dark,
        builder: (light, dark) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: light,
              darkTheme: dark,
              initialRoute: '/main',
              onGenerateRoute: _myRoutes.onGenerateRoute,
            ));
  }
}
