import 'package:FluuterNews/Model/ItemModel.dart';
import 'package:FluuterNews/Repository/NewsProvider.dart';
import 'package:rxdart/rxdart.dart';

class HeadlineBloc {
  final repo = NewsApi();

  final _headlineController = PublishSubject<List<ItemModel>>();

  Stream<List<ItemModel>> get addStream => _headlineController.stream;

  Future<void>getItem() async {
    final item = await repo.fetchArticles();
    _headlineController.sink.add(item);
  }

  dispose() {
    _headlineController.close();
  }
}
