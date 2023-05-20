import 'package:bank_queue_system/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'controlar/data.dart';

class Alluser extends StatefulWidget {
  const Alluser({super.key});

  @override
  State<Alluser> createState() => _AlluserState();
}

class _AlluserState extends State<Alluser> {
  final c = Get.put(mysql());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 14, 10, 32),
        ),
        backgroundColor: Color.fromARGB(255, 14, 10, 32),
        body: SafeArea(
            child: Expanded(
                child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) =>
              card(c.list_allUser[index][0], c.list_allUser[index][1]),
        ))));
  }

  Widget card(String title, int sq) {
    var ss = "";
    if (sq == 1) {
      ss = "withdraw";
    } else if (sq == 2) {
      ss = "deposit";
    } else {
      ss = "Register";
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        textColor: Colors.white,
        tileColor: primerColor,
        title: Text("$title ----> $ss"),
        leading: CircleAvatar(child: Text("${title[0]}")),
      ),
    );
  }
}
