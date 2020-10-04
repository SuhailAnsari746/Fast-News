import 'package:FluuterNews/Model/CategoryModel.dart';
import 'package:FluuterNews/Repository/NewsProvider.dart';
import 'package:rxdart/rxdart.dart';

List<List<CategoryModel>> parCategory = [];
int index;

class CategoryBloc {
  final repo = NewsApi();

  final _categoryController = PublishSubject<List<List<CategoryModel>>>();

  Stream<List<List<CategoryModel>>> get addStream => _categoryController.stream;

  Future<void> getItem(int index) async {
    final item = await repo.fetchCategory(catItem[index - 1]);
    parCategory.add(item);
    print(parCategory[0].length);
    _categoryController.sink.add(parCategory);

    parCategory = [];
  }

  dispose() {
    _categoryController.close();
  }
}
