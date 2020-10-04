import 'package:FluuterNews/Model/ItemModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:swipe_up/swipe_up.dart';

class DescriptionScreen extends StatelessWidget {
  static const routename = './DescriptionScreen';
  final ItemModel item;
  DescriptionScreen(this.item);

  @override
  Widget build(BuildContext context) {
    return SwipeUp(
      color: Colors.white,
      sensitivity: 0.7,
      onSwipe: () {
        launch(item.url);
      },
      child:Material(
        color: Colors.transparent,
        child: Text("Swipe up for More",style: TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),),
      ),
      body: Scaffold(
        appBar: AppBar(
          title: Text('${item.title}',style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
          
        ),
        body: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffEB3349),
                      Color(0xffF45C43),
                    ],
                    stops: [0.2, 0.8],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    tileMode: TileMode.repeated,
                  )),
            ),
            Container(
              height: ScreenUtil().setHeight(300),//300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(ScreenUtil().setWidth(50)),
                    bottomRight: Radius.circular(ScreenUtil().setWidth(50)),
                  ),
                  image: DecorationImage(
                      image: NetworkImage('${item.urlToImage}'),
                      fit: BoxFit.fill),
                  color: Colors.white),
            ),
            Positioned(
              bottom: ScreenUtil().setHeight(0),//90,
              left: ScreenUtil().setWidth(0) ,
              right: ScreenUtil().setWidth(0),
              child: Container(
                height: ScreenUtil().setHeight(250),//250,
                width: ScreenUtil().setWidth(250),//250,
                
                padding: EdgeInsets.only(
                  right: ScreenUtil().setWidth(10),//10,
                  left: ScreenUtil().setWidth(10),//10,
                ),
                child: Text(
                  item.description == null || item.description == ''
                      ? item.title
                      : item.description,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),//27,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
