import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ic_camasir_site/mainscreen.dart';
import 'package:ic_camasir_site/service/UrunService/urunservice.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Text(
              'AURORA iç giyim',
              style: TextStyle(color: Colors.black, fontSize: 70),
            ),
          )),
    );
  }

  cagirma() async {
    await UrunService.urunCek();
  }

  @override
  void initState() {
    cagirma();
    super.initState();
    Timer(
      const Duration(milliseconds: 500),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      ),
    );
  }
}
