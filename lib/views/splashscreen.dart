import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/views/homescreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homescreen()));
    });
  }
  Widget build(BuildContext context) {
    final hight = MediaQuery.sizeOf(context).height*1;
    final width = MediaQuery.sizeOf(context).width*1;

    return  Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Image.asset("images/splash_pic.jpg",
              fit: BoxFit.cover,
              height: hight*.5,
            ),
            SizedBox(height: hight*0.04,),
            Text("TOP HEADLINES", style: GoogleFonts.anton(letterSpacing: .6, color: Colors.grey.shade700),),
            SizedBox(height: hight*0.04,),
            SpinKitChasingDots(
              color: Colors.blue,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
