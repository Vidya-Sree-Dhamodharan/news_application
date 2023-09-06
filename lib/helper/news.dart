import 'dart:convert';

import 'package:flutternews/models/article_model.dart';
import 'package:http/http.dart' as http;
//getting data from api and putting it in news []
class News{

  List<ArticleModel> news = [];
  Future<void> getNews() async{
  String url= "https://newsapi.org/v2/top-headlines?country=in&apiKey=6130241b3d36484f947073162a222e3c";
  var response= await http.get(url);
  var jsonData=jsonDecode(response.body);
  
  if (jsonData['status']=='ok'){
    jsonData["articles"].forEach((element){
      if (element["urlToImage"]!=null && element["description"]!=null){
        ArticleModel articleModel = ArticleModel(
          title: element["title"],
          author: element["author"],
          description: element["description"],
          url: element["url"],
          urlToImage: element["urlToImage"],
          content: element["context"]
        );
        news.add(articleModel);
      }

    });
  }  }

}
class CategoryNewsClass{

  List<ArticleModel> news = [];
  Future<void> getNews(String category) async{
  String url= "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=6130241b3d36484f947073162a222e3c";
  var response= await http.get(url);
  var jsonData=jsonDecode(response.body);
  
  if (jsonData['status']=='ok'){
    jsonData["articles"].forEach((element){
      if (element["urlToImage"]!=null && element["description"]!=null){
        ArticleModel articleModel = ArticleModel(
          title: element["title"],
          author: element["author"],
          description: element["description"],
          url: element["url"],
          urlToImage: element["urlToImage"],
          content: element["context"]
        );
        news.add(articleModel);
      }

    });
  }  }

}
