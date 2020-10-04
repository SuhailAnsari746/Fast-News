
List<String> catItem =[
  'sports',
   'entertainment',
   'technology',
];

class CategoryModel {
  final String source;
  final String author;
  final String title;
  final String url;
  final String urlToImage;
  final String content;
  final String description;
  final String date;

  CategoryModel.fromJson(Map<String, dynamic> parsedJson)
      : source = parsedJson['source']['name'],
        author = parsedJson['author'] ?? 'Suhail',
        title = parsedJson['title'] ?? 'Suhail',
        url = parsedJson['url'],
        urlToImage = parsedJson['urlToImage'] ??
            'https://as2.ftcdn.net/jpg/02/58/29/09/500_F_258290955_48MCm6IcnSN3sodcIoOMXnucbTpsFiI9.jpg',
        content = parsedJson['content'] ?? 'Suhail',
        description = parsedJson['description'] ?? 'Suhail',
        date = parsedJson['publishedAt'];
}
