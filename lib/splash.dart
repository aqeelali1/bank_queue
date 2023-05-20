import 'package:bank_queue_system/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controlar/data.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final c = Get.put(mysql());

  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      c.get_data();
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomePage()));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 10, 32),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              // Image.asset(
              //   'assets/image/student.png',
              //   height: 350,
              //   width: 350,
              // ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
