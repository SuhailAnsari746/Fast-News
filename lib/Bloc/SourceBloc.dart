import 'package:FluuterNews/Model/SourcesModel.dart';
import 'package:FluuterNews/Repository/NewsProvider.dart';
import 'package:rxdart/rxdart.dart';

class SourceBloc {
  final repo = NewsApi();
  final _sourceItemController = PublishSubject<List<SourceItemModel>>();

  Stream<List<SourceItemModel>> get sourceStream =>
      _sourceItemController.stream;

  getSourceItem() async {
    final sourceItem = await repo.fetchSource();
    _sourceItemController.sink.add(sourceItem);
  }

  dispose() {
    _sourceItemController.close();
  }
}
