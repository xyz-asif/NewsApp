import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../exports/exports.dart';

class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  final sc = ScrollController();
  List<dynamic> posts = [];
  int pageNumber = 1;
  bool loadingStatus = true;
  int total = 20;

  Future<void> fetch(int page) async {
    setState(() {
      loadingStatus = true;
    });

    final url =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=62493f2234d3471f832d2dbba9bdde5e';
    final response = await http.get(Uri.parse(url));

    setState(() {
      loadingStatus = false;
      posts = jsonDecode(response.body)['articles'];
    });
  }

  @override
  void initState() {
    super.initState();
    sc.addListener(listner);
    fetch(pageNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 48, 47, 47),
      body: loadingStatus
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: sc,
              itemCount: posts.length + 1,
              itemBuilder: (context, index) {
                if (index == posts.length) {
                  if (loadingStatus) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return SizedBox();
                  }
                }

                final post = posts[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Card(
                    color: Color.fromARGB(255, 218, 229, 235),
                    child: ListTile(
                      isThreeLine: true,
                      title: titleText(post['title'] ?? 'xyz'),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: autherText(
                            'by: \n${post['author'] ?? 'Not Found'}'),
                      ),
                      contentPadding: EdgeInsets.all(16.0),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullArticle(
                                    content: post['content'],
                                    imageUrl: post['urlToImage'],
                                    link: post['url'],
                                  )),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }

  listner() {
    if (sc.position.pixels == sc.position.maxScrollExtent) {
      pageNumber++;
      fetch(pageNumber);
    } else {
      print("dont call function");
    }
  }
}
