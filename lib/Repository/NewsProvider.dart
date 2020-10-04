import 'package:FluuterNews/Model/CategoryModel.dart';
import 'package:FluuterNews/Model/ItemModel.dart';
import 'package:FluuterNews/Model/SourcesModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<ItemModel> article = [];
List<SourceItemModel> sourceItem = [];
List<CategoryModel> categoryItem = [];

class NewsApi {
  Future<List<SourceItemModel>> fetchSource() async {
    final response = await http.get(
        'https://newsapi.org/v2/sources?country=in&apiKey=601a108ef91c47328c8d20264ceb22ef');
    final Map<String, dynamic> srps = json.decode(response.body);
    //   print(srps);
    List<dynamic> data = srps['sources'];
    data.forEach((element) {
      SourceItemModel item = SourceItemModel.fromJson(element);
      sourceItem.add(item);
    });
    return sourceItem;
  }

  Future<List<ItemModel>> fetchArticles() async {
    final response = await http.get(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=601a108ef91c47328c8d20264ceb22ef');
    final Map<String, dynamic> rps = json.decode(response.body);
    List<dynamic> data = rps['articles'];
    data.forEach((element) {
      ItemModel item = ItemModel.fromJson(element);
      article.add(item);
    });
    return article;
  }

  Future<List<CategoryModel>> fetchCategory(String category) async {
    categoryItem = [];
    final response = await http.get(
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=601a108ef91c47328c8d20264ceb22ef');
    final Map<String, dynamic> rps = json.decode(response.body);
    //  print(rps);
    List<dynamic> data = rps['articles'];
    data.forEach((element) {
      CategoryModel item = CategoryModel.fromJson(element);
      categoryItem.add(item);
    });
    return categoryItem;
  }
}
