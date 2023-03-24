// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../exports/exports.dart';

class FullArticle extends StatelessWidget {
  final String imageUrl;
  final String content;
  final String link;

  FullArticle(
      {required this.imageUrl, required this.content, required this.link});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Article'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: contentText(
              content,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              child: Text('web link'),
              onPressed: () async {
                // ignore: deprecated_member_use
                if (await canLaunch(link)) {
                  await launch(link);
                } else {
                  throw 'Could not launch $link';
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
