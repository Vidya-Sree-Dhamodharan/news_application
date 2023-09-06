import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/helper/data.dart';
import 'package:flutternews/helper/news.dart';
import 'package:flutternews/models/article_model.dart';
import 'package:flutternews/models/category_model.dart';
import 'package:flutternews/views/article_view.dart';
import 'package:flutternews/views/category_news.dart';
// creating stetful widget to be able to get other catergories
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories= <CategoryModel>[];
  List<ArticleModel> articles= <ArticleModel>[];
  bool _loading=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }
  getNews()async{
    News news=News();
    await news.getNews(); //we wait util we get the news
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
              Container(//For displaying categories on the app
                
                height:70,
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,//used to make the scroll of a listbiew in a horizontal manner moving left to right
                   itemBuilder: (context,index){
                    return CategoryTile(
                      imageURL: categories[index].imageURL,
                      categoryName: categories[index].categoryName,
                    );
                   }),
              ),
              //For displaying news blogs on the app
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
          ) ,),
      )
    );
  }
}
//creating tiles for each category
class CategoryTile extends StatelessWidget {

  final imageURL,categoryName;
  CategoryTile({this.imageURL,this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>CategoryNews(
            category: categoryName.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.only( right: 16),
        child:Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),//curved edge of picture
              child: CachedNetworkImage(imageUrl: imageURL, width:120, height: 100,fit: BoxFit.cover)),//boxfit.cover is to stretch pictures to touch one another to avoid gaps between them
            Container(
              alignment: Alignment.center, // To align category name in center of picture
              width:120, height: 100 ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),//curved edges of black 
                color:Colors.black26,// to make the category name on the picture visible 
              ),
              child: Text(
                categoryName, 
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500 )
              ),
            )
          ],
        )
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