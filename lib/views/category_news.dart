import 'package:flutter/material.dart';
import 'package:flutternews/helper/news.dart';
import 'package:flutternews/models/article_model.dart';
import 'package:flutternews/views/article_view.dart';

class CategoryNews extends StatefulWidget {
  // const CategoryNews({super.key});
  final String category;
  CategoryNews({required this.category});
  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading=true;
  @override
  void initState() {
    super.initState();
    getCategoryNews();
    
  }

  getCategoryNews()async{
    CategoryNewsClass news=CategoryNewsClass();
    await news.getNews(widget.category); //we wait util we get the news
    articles=news.news;
    setState(() {
      _loading=false;//when data recieved turn loading into false
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter",style:TextStyle(color: Colors.black,fontWeight: FontWeight.normal)),
            Text("News",style:TextStyle(color: Colors.blue,fontWeight: FontWeight.normal))
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save)),
          )
        ],
        elevation: 0.0,
      ), 
      body: _loading?Center(
        child: Container(
          child:CircularProgressIndicator(),),
      ):SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal:16),
          child: Column(
            children: [
              Container(
                 padding: EdgeInsets.only(top:16),
                  child:ListView.builder(
                    itemCount:articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context,index){
                      return BlogTile(
                        imageUrl: articles[index].urlToImage, 
                        desc:articles[index].description, 
                        title: articles[index].title,
                        url: articles[index].url,);
                    })
                )
            ],
          ),
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc,url;
  BlogTile({required this.imageUrl, required this.desc, required this.title, required this.url});
  // const BlogTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>ArticleView(BlogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child:Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)
              ),
            Text(title, style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
            SizedBox(height:8),
            Text(desc, style:TextStyle(
              color: Colors.black54
            ))
          ],
        )
      ),
    );
  }
}
