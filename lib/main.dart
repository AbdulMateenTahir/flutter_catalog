import 'package:flutter/material.dart';
import 'package:flutter_catlog/Pages/Home_page.dart';
import 'package:flutter_catlog/Pages/login_page.dart';
import 'package:flutter_catlog/utils/Routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        // primarySwatch: Colors.blueGrey,
        //primaryTextTheme: GoogleFonts.zcoolQingKeHuangYou()
      ),
      //darkTheme: ThemeData(primarySwatch: Colors.deepOrange),
      routes: {
        "/": (context) => Login_Page(),
        MyRouts.homeRouts: (context) => HomePage(),
        MyRouts.loginRoute: (context) => HomePage(),
      },
    );
  }
}
