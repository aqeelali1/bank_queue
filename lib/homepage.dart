import 'dart:ffi';

import 'package:bank_queue_system/Theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mysql1/mysql1.dart';

import 'controlar/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final c = Get.put(mysql());
  @override
  @override
  void initState() {
    c.Count1;
    c.Count2;
    c.Count3;
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    c.get_data();
    c.Count1;
    c.Count2;
    c.Count3;
    super.setState(fn);
  }

  dynamic get_c() {
    return c.Count1;
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
                  screentitle("Withdraw"),
                  screentitle("Deposit"),
                  screentitle("Register"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  screenCard(c.Count1),
                  screenCard(c.Count2),
                  screenCard(c.Count3),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            c.see_data();
                          },
                          child: Text("See data")),
                    )
                  ],
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                _showDialog2(context);
              },
              child: Text(
                "Add User",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              color: primerColor,
              height: MediaQuery.of(context).size.height * .10,
            )
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
    setState(() {
      c.get_data();
    });
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

  void _showDialog2(BuildContext context) {
    TextEditingController name = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                contentPadding: const EdgeInsets.all(25),
                label: const Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 159, 159, 159)),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: name,
            ),
            DropdownButton<String>(
              borderRadius: BorderRadius.circular(10),
              focusColor: Colors.white,
              elevation: 5,
              style: TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: <String>[
                'male',
                'Female',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              hint: const Text(
                "Select Gander",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ]),
          actions: [
            ElevatedButton(
              child: Text('Cansel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget screenCard(var id) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.25,
          child: Center(
            child: Text(
              chek(id),
              style: TextStyle(
                  color: Colors.white, fontSize: 100, fontFamily: 'Digital'),
            ),
          ),
          decoration: BoxDecoration(
              color: primerColor, borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          onPressed: () {
            setState(() {
              c.Count1 = get_c();
              c.next_data(c.user1[1]);
              c.get_data();
            });
          },
          child: Text("Next", style: GoogleFonts.poppins(color: Colors.white)),
          color: primerColor,
        )
      ],
    );
  }

  String chek(var id) {
    c.get_data();

    return id == null ? "0" : id.toString();
  }
}
