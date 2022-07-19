// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sepatuku/pages/detail_chat_page.dart';
import 'package:sepatuku/pages/home/edit_profile_page.dart';
import 'package:sepatuku/pages/home/main_page.dart';
import 'package:sepatuku/pages/sign_in_page.dart';
import 'package:sepatuku/pages/sign_up_page.dart';
import 'package:sepatuku/pages/splash_page.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/detail-chat': (context) => DetailChatPage(),
        '/edit-profile': (context) => EditProfilePage(),
      },
    );
  }
}
