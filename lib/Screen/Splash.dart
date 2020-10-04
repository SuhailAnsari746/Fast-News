import 'package:FluuterNews/Screen/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashscreen/splashscreen.dart';


class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: Home(),
      gradientBackground: LinearGradient(
          colors: [Color(0xffEB3349), Color(0xffF45C43)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,          
          tileMode: TileMode.repeated),
      title: Text(
        "Fast News ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
      image: Image.asset('lib/Asset/icimage.png'),
      loaderColor: Colors.white,
      loadingText: Text("Loading"),
      photoSize: ScreenUtil().setHeight(100),
    );    
  }
  
}
