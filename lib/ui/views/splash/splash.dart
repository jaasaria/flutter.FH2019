import 'dart:async';
import 'package:fh2019/core/config/routes.dart';
import 'package:fh2019/core/shared/custom_assets.dart';
import 'package:flutter/material.dart';
import 'package:fh2019/core/shared/custom_colors.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, Routes.layout));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Image.asset(CustomAssets.logo))),
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      decoration: BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColors.secondaryColorLight,
            CustomColors.primaryColorLight
          ],
        ),
      ),
    );
  }
}
