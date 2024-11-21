import 'package:flutter/material.dart';
import 'package:praktekin/model/content.dart';

class DetailContentScreen extends StatelessWidget{
  DetailContentScreen({Key? key, required this.content}): super(key: key);
  final Content content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(content.title),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: Image.asset(content.image, width: 150,),),
              ),
              Center(
                child: Column(
                  children: [
                    Text(content.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(content.description, style: TextStyle(fontSize: 14,),),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.remove_red_eye), Text(' ${content.viewCount.toString()} melihat',),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.thumb_up), Text(' ${content.likeCount.toString()} menyukai',),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}