import 'package:flutter/material.dart';
import 'package:qroomac/src/login.dart';
import 'package:qroomac/src/mainPersonal.dart';
import 'package:qroomac/src/mainAdmin.dart';
import 'package:qroomac/src/orderPage.dart';
import 'package:qroomac/src/orderPageUser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ATM Sense",
      debugShowCheckedModeBanner: true,
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: loginPage.id,
      routes: {
        loginPage.id: (context) => loginPage(),
        mPersonalPage.id: (context) => mPersonalPage(),
        mAdminPage.id: (context) => mAdminPage(),
        orderPage.id: (context) => orderPage(),
        orderPageUser.id: (context) => orderPageUser()
      },
    );
  }
}
