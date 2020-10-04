import 'package:FluuterNews/Bloc/HeadlineBloc.dart';
import 'package:flutter/material.dart';

class HeadlineBlocProvider extends InheritedWidget {
  final headlineBloc = HeadlineBloc();
  HeadlineBlocProvider({
    Key key,
    Widget child,
  }) : super(key: key, child: child);
  bool updateShouldNotify(_) => true;
  static HeadlineBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(HeadlineBlocProvider)
            as HeadlineBlocProvider)
        .headlineBloc;
  }
}
