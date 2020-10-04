import 'package:FluuterNews/Bloc/SourceBloc.dart';
import 'package:flutter/material.dart';

class SourceBlocProvider extends InheritedWidget {
  final sourceBloc = SourceBloc();
  SourceBlocProvider({
    Key key,
    Widget child,
  }) : super(key: key, child: child);
  bool updateShouldNotify(_) => true;
  static SourceBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(SourceBlocProvider)
            as SourceBlocProvider)
        .sourceBloc;
  }
}
