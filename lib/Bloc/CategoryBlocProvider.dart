import 'package:FluuterNews/Bloc/CategoryBloc.dart';
import 'package:flutter/material.dart';

class CategoryBlocProvider extends InheritedWidget {
  final categoryBloc = CategoryBloc();
  CategoryBlocProvider({
    Key key,
    Widget child,
  }) : super(key: key, child: child);
  bool updateShouldNotify(_) => true;
  static  CategoryBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CategoryBlocProvider)
            as CategoryBlocProvider)
        .categoryBloc;
  }
}
