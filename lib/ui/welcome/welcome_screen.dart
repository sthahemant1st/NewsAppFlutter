import 'package:flutter/material.dart';
import 'package:new_app_flutter/services/service_locator.dart';
import 'package:new_app_flutter/shared_preference/news_shared_prefrences.dart';
import 'package:new_app_flutter/ui/home/home_screen.dart';
import 'package:new_app_flutter/ui/welcome/welcome_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final prefs = serviceLocator<NewsSharedPreferences>();
  final welcomeViewModel = serviceLocator<WelcomeViewModel>();

  final _userNameController = TextEditingController();

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
    return ChangeNotifierProvider<WelcomeViewModel>(
      create: (context) => welcomeViewModel,
      child: Consumer<WelcomeViewModel>(
        builder: (context, model, child) => Scaffold(
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
                          onChanged: (changedString) {
                            if (changedString.isNotEmpty) {
                              model.changeUserNameValid(true);
                            }
                          },
                          decoration: const InputDecoration(
                            filled: false,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Full Name:',
                            hintText: 'Please enter your full name.',
                          ),
                          obscureText: false //ture for password,
                          ),
                    ),
                  ),
                  Visibility(
                    maintainState: true,
                    maintainAnimation: true,
                    visible: !model.userNameValid,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Error',
                        style: TextStyle(color: Colors.red),
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
                      if (_userNameController.text.trim().isNotEmpty) {
                        prefs.setUserName(_userNameController.text);
                        Navigator.pushReplacementNamed(
                          context,
                          HomeScreen.routeName,
                          arguments:
                              HomeScreenArgument(_userNameController.text),
                        );
                      } else {
                        model.changeUserNameValid(false);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please enter your name.')));
                      }
                    },
                    child: const Text("Start Reading"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
