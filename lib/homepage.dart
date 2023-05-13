import 'package:bank_queue_system/Theme.dart';
import 'package:bank_queue_system/mysqlcon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mysql1/mysql1.dart';

import 'mysqlcon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data;
  var settings;
  var conn;
  void con() async {
    settings = new ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'aqeel1234',
        db: 'bank_queue');
    conn = await MySqlConnection.connect(settings);
  }

  @override
  void initState() {
    con();
    super.initState();
  }

  void get_data() async {
    data = await conn.query('select * from users ');

    print(data.runtimeType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 10, 32),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              child: Row(children: [
                Image(
                  image: AssetImage(
                    "assets/image/scoreboard.png",
                  ),
                  height: 30,
                ),
                Spacer(),
                apptext("Theme"),
                apptext("Settings"),
                apptext("About us"),
              ]),
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  screentitle("WithDrow"),
                  screentitle("WithDrow"),
                  screentitle("WithDrow"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  screenCard(),
                  screenCard(),
                  screenCard(),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  get_data();
                  print(data);
                },
                child: Text("get data"))
          ],
        ),
      )),
    );
  }

  Widget apptext(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(color: Colors.white60),
          ),
          Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white60)
        ],
      ),
    );
  }

  Widget screentitle(String title) {
    return Column(
      children: [
        Text("$title",
            style: GoogleFonts.poppins(
                color: primerColor, fontSize: 20, fontWeight: FontWeight.w500)),
        SizedBox(
          height: 5,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: 3.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2), color: primerColor),
        )
      ],
    );
  }

  Widget screenCard() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.25,
      child: Center(
        child: Text(
          "22",
          style: TextStyle(
              color: Colors.white, fontSize: 100, fontFamily: 'Digital'),
        ),
      ),
      decoration: BoxDecoration(
          color: primerColor, borderRadius: BorderRadius.circular(10)),
    );
  }
}
