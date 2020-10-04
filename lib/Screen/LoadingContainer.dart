import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Shimmer.fromColors(
        child: ListView.builder(
        itemCount: 50,
        itemBuilder: (context,index)=>ListTile(
          leading: CircleAvatar(),
          title: Container(
            height: ScreenUtil().setHeight(40),//40,
            width:ScreenUtil().setWidth(80),//80,
            decoration: BoxDecoration(
              color: Colors.grey[400]
            ),
          ),
          subtitle: Padding(
            padding:  EdgeInsets.only(top: ScreenUtil().setHeight(10),bottom: ScreenUtil().setHeight(10)),
            child: Container(
              height: ScreenUtil().setHeight(20),// 20,
              width:ScreenUtil().setWidth(80),
              color: Colors.grey[400],
            ),
          ),
        ),
        ),
        baseColor: Colors.grey[200],
        highlightColor: Colors.white,
      ),
    );
  }
}
