class SourceItemModel {
  final String id;
  final String name;
  final String description;
  final String url;

  SourceItemModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        name = parsedJson['name']?? 'suhail',
        description = parsedJson['description'],
        url = parsedJson['url'];
}
