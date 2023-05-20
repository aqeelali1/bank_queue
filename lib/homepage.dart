import 'dart:ffi';

import 'package:bank_queue_system/Theme.dart';
import 'package:bank_queue_system/listuser.dart';

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
                  screenCard(c.Count1, 1),
                  screenCard(c.Count2, 2),
                  screenCard(c.Count3, 3),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Center(
            //           child: ElevatedButton(
            //               onPressed: () {
            //                 c.see_data();
            //               },
            //               child: Text("See data")),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
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
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Alluser()));
              },
              child: Text(
                "ٍSee all",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              color: primerColor,
              height: MediaQuery.of(context).size.height * .10,
            ),
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
    TextEditingController age = TextEditingController();
    var service;
    var gander;
    var s;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: primerColor.withAlpha(230),
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
                      color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: name,
            ),
            Row(
              children: [
                DropdownButton<String>(
                  value: gander,
                  dropdownColor: primerColor,
                  borderRadius: BorderRadius.circular(10),
                  focusColor: primerColor,
                  elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Color.fromARGB(255, 255, 255, 255),
                  items: <String>[
                    'male',
                    'Female',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    );
                  }).toList(),
                  hint: const Text(
                    "Select Gander",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (value) {
                    setState(() {
                      gander = value;
                    });
                  },
                ),
                DropdownButton<String>(
                  value: service,
                  dropdownColor: primerColor,
                  borderRadius: BorderRadius.circular(10),
                  focusColor: primerColor,
                  elevation: 5,
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  iconEnabledColor: Color.fromARGB(255, 255, 255, 255),
                  items: <String>['withdraw', 'deposit', 'register']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    );
                  }).toList(),
                  hint: const Text(
                    "Select Service",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (value) {
                    setState(() {
                      service = value;
                    });
                  },
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                contentPadding: const EdgeInsets.all(25),
                label: const Text(
                  "Age",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: age,
            ),
          ]),
          actions: [
            MaterialButton(
              color: primerColor,
              child: Text(
                'Cansel',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            MaterialButton(
              color: primerColor,
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (service == 'withdraw') {
                  s = 1;
                } else if (service == "deposit") {
                  s = 2;
                } else {
                  s = 3;
                }

                c.add_someone(name.text, int.parse(age.text), gander, s);
                c.get_data();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget screenCard(var id, int ch) {
    var how;
    if (ch == 1) {
      how = c.user1[1];
    } else if (ch == 2) {
      how = c.user2[1];
    } else if (ch == 3) {
      how = c.user3[1];
    }
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
              c.next_data(how);
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
