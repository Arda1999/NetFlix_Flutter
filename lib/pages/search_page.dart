import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_flutter/json/root_app_json.dart';
import 'package:netflix_flutter/json/search_json.dart';
import 'package:netflix_flutter/pages/video_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List searchJson = [
    {
      "img": "assets/images/search_1.jpg",
      "title": "Age of Samurai: Battle for Japan",
      "video": "assets/videos/video_1.mp4",
    },
    {
      "img": "assets/images/search_2.jpg",
      "title": "Aquaman",
      "video": "assets/videos/video_2.mp4",
    },
    {
      "img": "assets/images/search_3.jpg",
      "title": "Animals on the Loose: A You vs. Wild Movie",
      "video": "assets/videos/video_2.mp4",
    },
    {
      "img": "assets/images/search_4.jpg",
      "title": "Tribes of Europa",
      "video": "assets/videos/video_2.mp4",
    },
    {
      "img": "assets/images/search_5.jpg",
      "title": "The Yin-Yang Master: Dream Of Eternity",
      "video": "assets/videos/video_2.mp4",
    },
    {
      "img": "assets/images/search_6.jpg",
      "title": "Space Sweepers",
      "video": "assets/videos/video_2.mp4",
    },
    {
      "img": "assets/images/search_7.jpg",
      "title": "Fate: The Winx Saga",
      "video": "assets/videos/video_2.mp4",
    }
  ];

  @override
  Widget build(BuildContext context) {
    searchJson.forEach((item) {
      print("${item["img"]}: ${item["title"]}");
    });
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Container(
          height: 35,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "search",
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                )),
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Text(
            "Top Searches",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            children: List.generate(searchJson.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: (Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => VideoDetailPage(
                                    videoUrl: "assets/videos/video1_1.mp4")));
                      },
                      child: Container(
                        width: (size.width - 36) * 0.8,
                        height: 80,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 120,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              searchJson[index]['img']),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  width: 120,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.2)),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: (size.width - 36) * 0.4,
                              child: Text(
                                searchJson[index]['title'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        width: (size.width - 36) * 0.18,
                        height: 80,
                        child: Center(
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.white)),
                            child: Center(
                                child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            )),
                          ),
                        )),
                  ],
                )),
              );
            }),
          )
        ]),
      ),
    );
  }
}
