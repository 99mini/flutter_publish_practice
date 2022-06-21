import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../model/menu_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

late List data;

class _HomePageState extends State<HomePage> {
  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/jsons/menuList.json');

    setState(() {
      data = json.decode(jsonText);
    });
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Widget _menuDetail(String title, String content, {String? unit}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        unit == null ? Text(content) : Text(content + unit),
      ],
    );
  }

  Widget _menuListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        var meal = data[index];
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: Colors.black26,
              ),
              right: BorderSide(
                width: 0.5,
                color: Colors.black26,
                //TODO dash line
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${meal['meal']}"),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          "${meal['totalKcal']}",
                          style: const TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        const Text(' kcal'),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 0.5,
                      color: Colors.black26,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${meal['menuName']}"),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _menuDetail("종류", meal['kind']),
                    _menuDetail("재료", meal['ingredients'][0]),
                    _menuDetail("정량", meal['dose'], unit: 'g'),
                    _menuDetail("칼로리", meal['kcal'], unit: 'kcal'),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _nutrientsBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("탄수화물"),
        const SizedBox(height: 4),
        Row(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.03,
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.03,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.purple[200]!, Colors.amber],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.2 - 24,
                  child: Text(
                    "24",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 4),
            const Text("100%"),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            _menuListView(),
            const SizedBox(height: 28),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "다량영양소",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black87,
                  ),
                ),
                _nutrientsBar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
