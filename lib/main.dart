import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app_flutter/home_screen.dart';
import 'package:new_app_flutter/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const WelcomeScreen(),
        HomeScreen.routeName :(context) => HomeScreen(),
      },
    );
  }
}

class HomeScreenArgument {
  final String username;

  HomeScreenArgument(this.username);
}

const sizedBox8 = SizedBox(
  height: 8,
);
const sizedBox16 = SizedBox(
  height: 16,
);
const sizedBox24 = SizedBox(
  height: 24,
);
const sizedBox48 = SizedBox(
  height: 48,
);
const paddingHorizontalNormal = EdgeInsets.symmetric(horizontal: 16);
