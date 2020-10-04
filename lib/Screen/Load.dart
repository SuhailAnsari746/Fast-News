import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingContainer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Shimmer.fromColors(
        child: Container(
          height: ScreenUtil().setHeight(180),//180,
          width: ScreenUtil().setWidth(350),//350,
          padding: EdgeInsets.all(  ScreenUtil().setWidth(20)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
          color: Colors.white,

          ),
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(10), left: ScreenUtil().setWidth(5), right: ScreenUtil().setWidth(5), bottom: ScreenUtil().setHeight(5)),
        ),
        baseColor: Colors.grey[200],
        highlightColor: Colors.white,
      ),
    );
  }
}
