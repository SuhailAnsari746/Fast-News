import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:FluuterNews/Model/CategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryScreen extends StatelessWidget {
  final List<CategoryModel> item;
  CategoryScreen(this.item);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () => launch('${item[index].url}'),
                // hoverColor: Theme.of(context).primaryColor,
                splashColor: Colors.yellow[300],
                focusColor: Colors.yellow[300],
                highlightColor: Colors.yellow[300],
                hoverColor: Colors.yellow[300],

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                           EdgeInsets.only(top: ScreenUtil().setHeight(8), left: ScreenUtil().setWidth(8), right: ScreenUtil().setWidth(8)),
                      child: Card(
                        elevation: 5,
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          height: ScreenUtil().setHeight(80),//100,
                          width:  ScreenUtil().setWidth(80),  //100,
                          decoration: BoxDecoration(
                              
                                  ),
                         child: FadeInImage(placeholder:NetworkImage(            'https://as2.ftcdn.net/jpg/02/58/29/09/500_F_258290955_48MCm6IcnSN3sodcIoOMXnucbTpsFiI9.jpg',),
                          image: NetworkImage('${item[index].urlToImage}'),fit: BoxFit.fill,),
                        ),
                      ),
                    ),
                    Container(
                        height: ScreenUtil().setHeight(100),//100,
                        width: ScreenUtil().setWidth(255),//280,
                        decoration: BoxDecoration(
                            //  border:Border.all(color: Colors.black,width: 3)
                            ),
                        child: ListView(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top:ScreenUtil().setHeight(4)),
                              child: Text(
                                item[index].title,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(13),//14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(
                                  right: ScreenUtil().setWidth(6), bottom: ScreenUtil().setHeight(2), top: ScreenUtil().setHeight(6)),
                              child: Text(
                                dates(DateTime.parse(item[index].date)),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: ScreenUtil().setSp(10),
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: ScreenUtil().setHeight(0)),
                              child: Text(
                                item[index].description,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(12),//13,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[400],
                height: ScreenUtil().setHeight(20),//20,
              )
            ],
          );
        });
  }

  String dates(DateTime date) =>
      timeago.format(date, allowFromNow: true, locale: 'en');
}
