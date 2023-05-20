import 'package:bank_queue_system/controlar/data.dart';
import 'package:bank_queue_system/homepage.dart';
import 'package:bank_queue_system/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  final c = Get.put(mysql());
  c.con();

  print("withdraw=${c.data_withdraw}");
  print("deposit=${c.data_deposit}");
  print("register=${c.data_register}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: SplashPage(),
    );
  }
}
