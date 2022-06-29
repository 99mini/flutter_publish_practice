import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

late List data;

class _HomePageState extends State<HomePage> {
  bool isHover = false;
  bool isFavorite = false;

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

  TextStyle _menuDetailTextStyle() {
    return const TextStyle(
      fontSize: 14,
      color: Colors.black54,
    );
  }

  BorderSide _menuBorderSide() {
    return const BorderSide(
      width: 0.5,
      color: Colors.black26,
    );
  }

  Widget _menuDetail(String title, String content, {String? unit}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: _menuDetailTextStyle(),
        ),
        unit == null
            ? Text(
                content,
                style: _menuDetailTextStyle(),
              )
            : Text(
                content + unit,
                style: _menuDetailTextStyle(),
              ),
      ],
    );
  }

  Widget _menuListView() {
    bool isHover = this.isHover;
    bool isFavorite = this.isFavorite;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        var meal = data[index];
        return Container(
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            border: Border(
              //TODO Dash Border
              right: _menuBorderSide(),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    top: index == 0
                        ? _menuBorderSide()
                        : const BorderSide(style: BorderStyle.none),
                    bottom: _menuBorderSide(),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${meal['meal']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          "${meal['totalKcal']}",
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          ' kcal',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  debugPrint("menu detail: $index");
                },
                onHover: (val) {
                  setState(() {
                    isHover = val;
                  });
                },
                hoverColor: Colors.blue[100],
                splashColor: Colors.blue[200],
                child: Container(
                  padding: const EdgeInsets.all(10),
                  // padding * 2 + border width
                  // 10 * 2 + 0.5
                  width: MediaQuery.of(context).size.width * 0.8 - 20.5,
                  decoration: BoxDecoration(
                    border: Border(
                      top: index == 0
                          ? _menuBorderSide()
                          : const BorderSide(style: BorderStyle.none),
                      left: _menuBorderSide(),
                      bottom: _menuBorderSide(),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${meal['menuName']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              debugPrint("favorite menu: $index - $isFavorite");
                              setState(() {
                                //TODO favorite을 데이터 별로 나누기
                                this.isFavorite =
                                    this.isFavorite ? false : true;
                              });
                            },
                            child: Icon(
                              this.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              size: 18,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _menuDetail("종류", meal['kind']),
                      _menuDetail("재료", meal['ingredients'][0]),
                      _menuDetail("정량", meal['dose'], unit: 'g'),
                      _menuDetail("칼로리", meal['kcal'], unit: 'kcal'),
                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _nutrientsBar({
    required String title,
    required double percentage,
    required List<Color> colors,
  }) {
    double barWidth = 0.8;
    double barHight = 0.03;
    var percentageWidth =
        MediaQuery.of(context).size.width * barWidth * 0.01 * percentage;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(title),
        const SizedBox(height: 4),
        Row(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * barWidth,
                  height: MediaQuery.of(context).size.height * barHight,
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                  ),
                ),
                Container(
                  width: percentageWidth,
                  height: MediaQuery.of(context).size.height * barHight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: colors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                ),
                Positioned(
                  left: percentageWidth - 24,
                  child: Text(
                    "$percentage",
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

  Widget _nutrientBarWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "다량영양소",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        _nutrientsBar(
          title: "탄수화물",
          percentage: 24,
          colors: [Colors.purple[200]!, Colors.amber],
        ),
        _nutrientsBar(
            title: "단백질",
            percentage: 65,
            colors: [Colors.purple[400]!, Colors.amber]),
        _nutrientsBar(
          title: "지방",
          percentage: 51,
          colors: [Colors.blue[200]!, Colors.amber],
        ),
        _nutrientsBar(
          title: "총 식이섬유",
          percentage: 24,
          colors: [Colors.blue[200]!, Colors.black26],
        ),
        _nutrientsBar(
          title: "콜레스트롤",
          percentage: 48,
          colors: [Colors.blue[200]!, Colors.green],
        ),
        _nutrientsBar(
          title: "총 포화 지방산",
          percentage: 48,
          colors: [Colors.blue[200]!, Colors.blueGrey],
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
            const SizedBox(height: 12),
            _menuListView(),
            const SizedBox(height: 28),
            _nutrientBarWidget(),
            const SizedBox(height: 28),
            PieChart(dataMap: {"단백질": 35.0, "탄수화물": 35.0, "지방": 30.0}),
          ],
        ),
      ),
    );
  }
}
