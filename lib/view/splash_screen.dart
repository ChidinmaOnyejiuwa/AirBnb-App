import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 3), ()
    {
      Get.to(LoginScreen());

    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors:[
                Colors. blueAccent,
                Colors.amber,
              ],
                  begin: FractionalOffset(0, 0),
            end: FractionalOffset(1, 0),
              stops: [0,1],
            tileMode: TileMode.clamp,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset(
                "images/splash.png"
              ),

              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Hi Your Welcome To My AirBnb App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
