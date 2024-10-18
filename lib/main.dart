import 'package:flutter/material.dart';
import 'package:flutter_application_3/home_page.dart';
import 'package:flutter_application_3/login_pages.dart';
import 'package:flutter_application_3/register_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login/Register Flutter',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: '/', // Halaman awal
      routes: {
        '/': (context) => LoginPage(),    // Rute untuk halaman login
        '/Register': (context) => RegisterPage(),  // Rute untuk halaman register
        '/Home': (context) => HomePage(fullname: 'Samuel'),
      },
    );
  }
}