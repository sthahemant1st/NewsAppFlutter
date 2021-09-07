import 'package:flutter/material.dart';
import 'package:new_app_flutter/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';
import '../main.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final prefs = serviceLocator<MySharedPreferences>();

  final _userNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _asyncMethod();
    super.initState();
  }

   _asyncMethod() async {
    _userNameController.text = await prefs.getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
                    child: TextFormField(
                        controller: _userNameController,
                        /*validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },*/
                        decoration: const InputDecoration(
                          filled: false,
                          border:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                          labelText: 'Full Name:',
                          hintText: 'Please enter your full name.'
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
                    if(_userNameController.text.trim().isNotEmpty){
                      prefs.setUserName(_userNameController.text);
                      Navigator.pushReplacementNamed(
                          context,
                          HomeScreen.routeName,
                          arguments: HomeScreenArgument(_userNameController.text)
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter your name.'))
                      );
                    }

                  },
                  child: const Text("Start Reading"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}