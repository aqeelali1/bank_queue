import 'dart:math';

import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';

class mysql extends GetxController {
  var data_withdraw;
  var data_deposit;
  var data_register;

  var user1, user2, user3;
  var CountS1;
  var CountS2;
  var CountS3;
  var Count1, Count2, Count3;

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
    get_data();
  }

  void see_data() {
    print("withdraw=${data_withdraw}");
    print("deposit=${data_deposit}");
    print("register=${data_register}");
    print("Count =$CountS1");
    print("Count =$CountS2");
    print("Count =$CountS3");
  }

  void get_data() async {
    data_withdraw = await conn.query(
        "select* from services where status='still' and service_id=1 limit 1;");
    data_deposit = await conn.query(
        "select* from services where status='still' and service_id=2 limit 1;");
    data_register = await conn.query(
        "select* from services where status='still' and service_id=3 limit 1;");

    CountS1 = await conn.query(
        "select* from services where status='still' and service_id=1 order by sid desc limit 1;");
    CountS2 = await conn.query(
        "select* from services where status='still' and service_id=2 order by sid desc limit 1;");
    CountS3 = await conn.query(
        "select* from services where status='still' and service_id=3 order by sid desc limit 1;");

    for (var element in data_withdraw) {
      user1 = element;
      Count1 = user1[3];
    }
    for (var element in data_deposit) {
      user2 = element;
      Count2 = user2[3];
    }
    for (var element in data_register) {
      user3 = element;
      Count3 = user3[3];
    }
    for (var element in CountS3) {
      CountS3 = element[3];
    }
    for (var element in CountS1) {
      CountS1 = element[3];
    }
    for (var element in CountS2) {
      CountS2 = element[3];
    }
  }

  //  next
  void next_data(var id_user) async {
    await conn.query(
        'update services set status=? where user_id=?', ['pass', id_user]);
  }

  void add_someone() async {
    var result = await conn.query(
        'INSERT INTO users (name, age, gender) VALUES(?,?, ?),',
        ['Bob', 25, 'male']);
  }
}
