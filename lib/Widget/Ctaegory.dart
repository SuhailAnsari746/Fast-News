import 'package:FluuterNews/Bloc/CategoryBlocProvider.dart';
import 'package:FluuterNews/Model/CategoryModel.dart';
import 'package:FluuterNews/Screen/CategoryScreen.dart';
import 'package:FluuterNews/Screen/LoadingContainer.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final int index;
  final String item;
  Category(this.index, this.item);
  static const routename = './Category';
  @override
  Widget build(BuildContext context) {
    final catBloc = CategoryBlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: catBloc.addStream,
        builder: (context, AsyncSnapshot<List<List<CategoryModel>>> snapshot) {
          if (!snapshot.hasData) {
            return LoadingContainer();
          } else {
            return CategoryScreen(snapshot.data[0]);
          }
        },
      ),
    );
  }
}
