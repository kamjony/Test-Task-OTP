import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testtaskotp/constants/color.dart';
import 'package:testtaskotp/routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Task OTP',
      theme: ThemeData(fontFamily: 'DMSans',
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/splash_view',
      getPages: RouteGenerator.routes,

    );
  }
}
