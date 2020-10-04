import 'package:FluuterNews/AnimatedNavbar/animated_bottom_bar.dart';
import 'package:FluuterNews/Bloc/CategoryBlocProvider.dart';
import 'package:FluuterNews/Bloc/HeadlineBlocProvider.dart';
import 'package:FluuterNews/Model/CategoryModel.dart';
import 'package:FluuterNews/Model/ItemModel.dart';
import 'package:FluuterNews/Screen/Load.dart';
import 'package:FluuterNews/Screen/TopChannel.dart';
import 'package:FluuterNews/Widget/Ctaegory.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:FluuterNews/Screen/DescriptionScreen.dart';
import 'package:FluuterNews/Screen/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<BarItem> barItems = [
    BarItem(
      text: "For you",
      iconData: FontAwesomeIcons.home,
      color: Colors.indigo,
    ),
    BarItem(
      text: "Sports",
      iconData: FontAwesomeIcons.footballBall,
      color: Colors.pinkAccent,
    ),
    BarItem(
        text: "Entertainment",
        iconData: FontAwesomeIcons.music,
        color: Colors.blue),
    BarItem(
      text: 'Technology',
      iconData: FontAwesomeIcons.desktop,
      color: Colors.orange,
    )
  ];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    final categoryBloc = CategoryBlocProvider.of(context);
    ScreenUtil.init(context,designSize: Size(360, 640), allowFontScaling: false);
    return Scaffold(
      bottomNavigationBar: AnimatedBottomBar(
          barItems: barItems,
          animationDuration: const Duration(milliseconds: 150),
          barStyle: BarStyle(fontSize: ScreenUtil().setSp(20), iconSize: 30.0),
          onBarTap: (int index) {
            if (index != 0) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                categoryBloc.getItem(index);
                return Category(index, catItem[index - 1]);
              }));
            }
            setState(() {
              selectedindex = index;
            });
          }),
      appBar: AppBar(
        centerTitle: true,
//          elevation: 0,
        title: Row(
          children: [
            Text("Fast",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(30),
                )),
            SizedBox(
              width: ScreenUtil().setWidth(10),
            ),
            Text(
              "News",
              style: TextStyle(
                color: Colors.purple,
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.bold,
              ),
            ),
           
          ],
          
        ),
        actions: [
       /*   Padding(
            padding: EdgeInsets.only(
              right:ScreenUtil().setWidth(10.0),
              
            ),*/
             Image(image:AssetImage('lib/Asset/playstore.png') ),
          
        ],
      ),
      body: BodyPart(),
    );
  }
}

class BodyPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = HeadlineBlocProvider.of(context);

    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () => bloc.getItem(),
      child: ListView(physics: AlwaysScrollableScrollPhysics(), children: [
        Padding(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(20), top: ScreenUtil().setHeight(20)),
          child: Text(
            "Headlines",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(25),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        StreamBuilder(
          stream: bloc.addStream,
          builder: (context, AsyncSnapshot<List<ItemModel>> snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: LoadingContainer1(),
              );
            else {
              return CarouselSlider(
                options: CarouselOptions(
                  height: ScreenUtil().setHeight(200),
                  viewportFraction: 0.9,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  //  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 4),
                  scrollPhysics: ScrollPhysics(),
                ),
                items: snapshot.data.map((item) {
                  return Builder(
                    builder: (context) => InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, DescriptionScreen.routename,
                            arguments: item),
                        child: MainScreen(item)),
                  );
                }).toList(),
              );
            }
          },
        ),
        Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(20),
                left: ScreenUtil().setWidth(20),
                right: ScreenUtil().setWidth(20),
                bottom: ScreenUtil().setHeight(10))),
        Padding(
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
          child: Text(
            "Top Channel",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(25),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(280), //300,
          width: MediaQuery.of(context).size.width,
          child: TopChannel(),
        ),
      ]),
    );
  }
}
