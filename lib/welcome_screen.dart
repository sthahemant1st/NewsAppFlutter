import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'main.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: paddingHorizontalNormal,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image.asset(
                  'assets/news.png',
                  height: 200,
                  width: 200,
                ),
              ),
              Text(
                "Welcome to News App",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.red[800]),
              ),
              sizedBox8,
              Text(
                "Please enter your name",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.red[200]),
              ),
              sizedBox48,
              Card(
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                elevation: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                      controller: _userNameController,
                      decoration: const InputDecoration(
                        filled: false,
                        border:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                        labelText: 'Name:',
                      ),
                      obscureText: false //ture for password,
                  ),
                ),
              ),
              sizedBox24,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  //other StadiumBorder, CircleBorder, BeveledRectangleBorder
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    HomeScreen.routeName,
                    arguments: HomeScreenArgument(_userNameController.text)
                  );
                },
                child: const Text("Start Reading"),
              )
            ],
          ),
        ),
      ),
    );
  }
}