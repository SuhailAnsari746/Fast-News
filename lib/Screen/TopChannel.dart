import 'package:FluuterNews/Bloc/SourceBlocProvider.dart';
import 'package:FluuterNews/Model/SourcesModel.dart';
import 'package:FluuterNews/Screen/Load.dart';
import 'package:FluuterNews/Widget/SourceParticularContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopChannel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sourceBloc = SourceBlocProvider.of(context);
    return StreamBuilder(
        stream: sourceBloc.sourceStream,
        builder: (context, AsyncSnapshot<List<SourceItemModel>> snapshot) {
          if (!snapshot.hasData) {
            return LoadingContainer1();
          } else {
            return GridView.builder(
              padding: EdgeInsets.all(20),
              physics: ScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) =>
                  ParticularScreen(snapshot.data[index], index),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent:200,  //200,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: ScreenUtil().setWidth(10),//10,
                crossAxisSpacing: ScreenUtil().setHeight(10),//10,
              ),
            );
          }
        });
  }
}
