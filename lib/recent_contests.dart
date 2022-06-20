import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentContests extends StatefulWidget {
  const RecentContests({Key? key}) : super(key: key);

  @override
  State<RecentContests> createState() => _RecentContestsState();
}

class _RecentContestsState extends State<RecentContests> {
  List info = [];
  List images = [];

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/detail.json")
        .then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString('json/img.json')
        .then((value) {
      setState(() {
        images = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFc5e5f3),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10),
        child: Center(
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i = 0; i < info.length; i++)
                          Container(
                            height: 240,
                            margin: EdgeInsets.only(bottom: 30),
                            child: GestureDetector(
                              onTap: () =>
                                  Get.toNamed('/detail', arguments: {
                                    'title': info[i]['title'].toString(),
                                    'text': info[i]['text'].toString(),
                                    'time': info[i]['time'].toString(),
                                    'img': info[i]['img'].toString(),
                                    'name': info[i]['name'].toString(),
                                    'prize': info[i]['prize'].toString(),
                                    'images': images.toList(),
                                  }),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 20),
                                height: 220,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 20,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:
                                  i.isEven ? Color(0xFF69c5df) : Color(
                                      0xFF9294cc),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              info[i]['title'],
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                            Expanded(child: Container())
                                          ],
                                        )),
                                    SizedBox(height: 10),
                                    Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      child: Text(
                                        info[i]['text'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFFb8eefc)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                    ),
                                    Row(
                                      children: [
                                        for (int i = 0; i < info.length; i++)
                                          Container(
                                            width: 50,
                                            height: 50,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(25),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      info[i]['img']),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
