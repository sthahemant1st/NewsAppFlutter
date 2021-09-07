import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app_flutter/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as HomeScreenArgument;
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome ${args.username}"),
      ),
      body: Container()
    );
  }
}
