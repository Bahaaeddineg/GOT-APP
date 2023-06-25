import 'package:flutter/material.dart';
import 'package:tvseries/constants/constants.dart';
import 'package:tvseries/routes.dart';

void main() {
  runApp(MyApp(
    myroutes: MyRoutes(),
  ));
}

class MyApp extends StatelessWidget {
  final MyRoutes myroutes;
  MyApp({required this.myroutes});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: MyColors.blue,
            appBarTheme: AppBarTheme(color: MyColors.blue)),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: myroutes.generateRoute);
  }
}
