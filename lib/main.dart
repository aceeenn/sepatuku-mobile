// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sepatuku/pages/cart_page.dart';
import 'package:sepatuku/pages/checkout_page.dart';
import 'package:sepatuku/pages/checkout_success_page.dart';
import 'package:sepatuku/pages/detail_chat_page.dart';
import 'package:sepatuku/pages/home/edit_profile_page.dart';
import 'package:sepatuku/pages/home/main_page.dart';
import 'package:sepatuku/pages/product_page.dart';
import 'package:sepatuku/pages/sign_in_page.dart';
import 'package:sepatuku/pages/sign_up_page.dart';
import 'package:sepatuku/pages/splash_page.dart';
import 'package:sepatuku/providers/auth_provider.dart';
import 'package:sepatuku/providers/product_provider.dart';
import 'package:sepatuku/providers/wishlist_provider.dart';
import 'theme.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
