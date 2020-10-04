import 'package:FluuterNews/Model/ItemModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

class MainScreen extends StatelessWidget {
  final ItemModel item;

  MainScreen(this.item);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
           EdgeInsets.only(top: ScreenUtil().setHeight(15) , bottom: ScreenUtil().setHeight(10),
            left:ScreenUtil().setWidth(10),//10, 
            right: ScreenUtil().setWidth(10)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                )
              ],
              image: DecorationImage(
                image: NetworkImage(item.urlToImage == null || item.urlToImage==""
                    ? 'https://as2.ftcdn.net/jpg/02/58/29/09/500_F_258290955_48MCm6IcnSN3sodcIoOMXnucbTpsFiI9.jpg'
                    : item.urlToImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          
          Positioned(
            bottom: ScreenUtil().setHeight(10),//10,
            left: ScreenUtil().setWidth(10)  ,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
              ),
              child: FittedBox(
                child: Text(
                  item.source,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(22),
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: ScreenUtil().setHeight(10),//10,
            right:ScreenUtil().setWidth(20),//20,
            child:Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),

              ),
              child:FittedBox(
                child:Text(dates(DateTime.parse(item.date)),style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                  fontSize: ScreenUtil().setSp(13),//15,
                ),),
              )
            )

          )
        ],
      ),
    );
  }

  String dates(DateTime date) =>
      timeago.format(date, allowFromNow: true, locale: 'en');
}
