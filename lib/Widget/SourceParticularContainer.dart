import 'package:FluuterNews/Model/SourcesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
List<Gradient> col = [
  LinearGradient(
      colors: [
        Color(0xff1488CC),
        Color(0xff2B32B2),
      ],
      begin: Alignment.topRight,
      end: Alignment.topLeft,
      tileMode: TileMode.repeated),
  LinearGradient(
      colors: [Color(0xff43C6AC), Color(0xffF8FFAE)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      // stops: [0.8,0.2],
      tileMode: TileMode.repeated),
  LinearGradient(
      colors: [Color(0xffAA076B), Color(0xff61045F)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      // stops: [0.8,0.2],
      tileMode: TileMode.repeated),
 LinearGradient(
      colors: [Color(0xffcc2b5e), Color(0xff753a88)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      // stops: [0.8,,0.2],
      tileMode: TileMode.repeated),
 LinearGradient(
      colors: [Color(0xffD31027), Color(0xffEA384D)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      // stops: [0.8,0.2],
      tileMode: TileMode.repeated),
 LinearGradient(
      colors: [Color(0xffFF512F), Color(0xffF09819)],
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      // stops: [0.8,0.2],
      tileMode: TileMode.repeated),                  
 LinearGradient(
      colors: [Color(0xffEB3349), Color(0xffF45C43)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      // stops: [0.8,0.2],
      tileMode: TileMode.repeated),
 LinearGradient(
      colors: [Color(0xff16222A), Color(0xff3A6073)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      // stops: [0.8,0.2],
      tileMode: TileMode.repeated),
 LinearGradient(
      colors: [Color(0xff614385), Color(0xff516395)],
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
      // stops: [0.8,0.2],
      tileMode: TileMode.repeated),
 LinearGradient(
      colors: [Color(0xffC04848), Color(0xff480048)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      // stops: [0.8,0.2],
      tileMode: TileMode.repeated),                  
];

class ParticularScreen extends StatelessWidget {
  final SourceItemModel item;
  final int index;
  ParticularScreen(this.item,this.index);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("hell");
        launch(item.url);
      },
      child: Container(
          height:ScreenUtil().setHeight(400), // 400,
          width: ScreenUtil().setWidth(400),//400,
          padding: EdgeInsets.only(top:ScreenUtil().setHeight(10),right: ScreenUtil().setWidth(10),
          left:ScreenUtil().setWidth(10)
          ),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              gradient: col[index%10]),
          child: Stack(
            children: [
              Positioned(
                bottom:   ScreenUtil().setHeight(20),//20,
                left:ScreenUtil().setWidth(0),
                child: Container(
                  width: ScreenUtil().setWidth(120),//150,
                  height:ScreenUtil().setHeight(85),//100,
                
                  //alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(image:AssetImage('lib/Asset/${item.name}.png'),fit:BoxFit.contain)
                    
                  ),
                ),
              ),
              Positioned(
                bottom: ScreenUtil().setHeight(6),//6,
              
                  child: FittedBox(
                     child: Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      
                      fontSize: ScreenUtil().setSp(14),//16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    softWrap: true,
                ),
                  ),
              ),
            ],
          )),
    );
  }
}
