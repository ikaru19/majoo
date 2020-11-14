import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:majoo_test/services/db_helper.dart';
import 'package:majoo_test/utils/v_color.dart';
import 'package:majoo_test/utils/v_navigation.dart';
import 'package:majoo_test/utils/v_pref.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opac = 0.0;

  _countDown() {
    Timer(Duration(milliseconds: 500), () async {
      opac = 1.0;
      setState(() {});
      _nextScreen();
    });
  }

  _nextScreen() {
    Timer(Duration(seconds: 2), () async {
      bool islogin = await VPref.getIsLogin();
      if (islogin == null || !islogin ) {
        VNavigation.toAuth(context);
      } else {
        VNavigation.toNavigation(context);
      }
    });
  }

  @override
  void initState() {
    _countDown();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      //print("user id : ${profileState?.profile?.user_id}");
      //FirebaseService(context, profileState, homeState).configure();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Center(
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: opac,
          child: Lottie.asset('assets/lottie/star_wars_logo.json', height: 200),
        ),
      ),
    );
  }
}
