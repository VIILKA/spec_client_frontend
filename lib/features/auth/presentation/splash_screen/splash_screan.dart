import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spec_client_app/core/routes/router.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    AutoRouter.of(context).push(const ChooseRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              child: Image.asset('assets/images/logo.png'),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            const CircularProgressIndicator(
              color: Colors.red,
              strokeWidth: 6,
            )
          ],
        ),
      ),
    );
  }
}
