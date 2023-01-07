import 'package:flutter/material.dart';
import 'package:netflix_flutter/json/root_app_json.dart';
import 'package:netflix_flutter/pages/coming_soon.dart';
import 'package:netflix_flutter/pages/download_page.dart';
import 'package:netflix_flutter/pages/home_pages.dart';
import 'package:netflix_flutter/pages/search_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        ComingSoonPage(),
        SearchPage(),
        DownloadPage(),
      ],
    );
  }

  Widget getFooter() {
    return Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(items.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = index;
                  });
                },
                child: (Column(
                  children: [
                    Icon(
                      items[index]['icon'],
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                      child: Text(
                        items[index]['text'],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )),
              );
            }),
          ),
        ));
  }
}
