import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  // const ArticleView({super.key});
  final String BlogUrl;
  ArticleView({required this.BlogUrl});

  @override
  State <ArticleView> createState() => _ArticleViewState();
}

class  _ArticleViewState extends State <ArticleView> {
  final Completer<WebViewController> _completer= Completer<WebViewController>();
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
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
      child:WebView(
        initialUrl:widget.BlogUrl ,
        onWebViewCreated: (WebViewController webViewController){
          _completer.complete(webViewController);
        },
      )
    ));
  }
}

