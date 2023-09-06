class ArticleModel{
  //created the class to create a model which we can use to fetch information from the newsapi as an object
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String content;

  ArticleModel({required this.author,required this.title,required this.description,required this.url,required this.urlToImage,required this.content});
}