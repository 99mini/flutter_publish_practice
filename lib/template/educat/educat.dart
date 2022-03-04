import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:publish_practice/template/educat/page/edu_home.dart';

class Educat extends StatelessWidget {
  const Educat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAE9E5),
      appBar: AppBar(
        title: Text(
          'Educat',
        ),
      ),
      body: EduHome(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        currentIndex: 1,
        onTap: (index) {
          print(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svgs/home.svg"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svgs/search.svg"),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svgs/activity.svg"),
            label: "Activity",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svgs/classroom.svg"),
            label: "Classroom",
          ),
        ],
      ),
    );
  }
}
