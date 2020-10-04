import 'package:FluuterNews/Bloc/CategoryBlocProvider.dart';
import 'package:FluuterNews/Bloc/HeadlineBlocProvider.dart';
import 'package:FluuterNews/Bloc/SourceBlocProvider.dart';
import 'package:FluuterNews/Model/ItemModel.dart';
import 'package:FluuterNews/Screen/DescriptionScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './Screen/Home.dart';
import "package:flutter/services.dart";

void main() {
  
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return CategoryBlocProvider(
      child: SourceBlocProvider(
        child: HeadlineBlocProvider(
              child: MaterialApp(
                theme: ThemeData(
                    primaryColor: Colors.orange[500],
                    backgroundColor: Colors.white),
                debugShowCheckedModeBanner: false,
                onGenerateRoute: route,
              ),
            ),
          ),
      );
  }

  Route route(RouteSettings setting) {
    if (setting.name == '/') {
      return MaterialPageRoute(
        builder: (context) {
          final bloc = HeadlineBlocProvider.of(context);
          bloc.getItem();
          final sourceBloc = SourceBlocProvider.of(context);
          sourceBloc.getSourceItem();
          return Home();
        },
      );
    }  else {
      final ItemModel item = setting.arguments;
      return MaterialPageRoute(
        builder: (context) {
          return DescriptionScreen(item);
        },
      );
    }
  }
}
