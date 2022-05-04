import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:publish_practice/template/educat/constant/constant.dart';

class EduHome extends StatelessWidget {
  const EduHome({Key? key}) : super(key: key);

  // select text btn
  Widget _selectText({
    required String title,
    required bool selected,
  }) {
    return GestureDetector(
      onTap: () {
        print('$title');
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 24.0),
        child: Text(
          title,
          style: GoogleFonts.jost(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: selected ? Colors.black : const Color(0xFFB9B5A8),
          ),
        ),
      ),
    );
  }

  // profile avator
  Widget _profileWidget() {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 7),
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 20,
                color: Color(0xFF727272),
              )
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/profile.jpg'),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 19,
            height: 19,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Constant.BACKGORUND_COLOR,
            ),
          ),
        ),
        Positioned(
          top: 6,
          right: 6,
          child: Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Constant.RED_COLOR,
            ),
          ),
        ),
      ],
    );
  }

  // homework card
  Widget _homeworkCard({
    required String img,
    required String teacherName,
    required String homeworkName,
    double progress = 1,
    bool onDartText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Stack(
        children: [
          Container(
            width: 190,
            height: 290,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/$img.jpg'),
              ),
            ),
          ),
          Positioned(
            top: 190,
            child: Container(
              width: 190,
              height: 290,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    teacherName,
                    style: GoogleFonts.jost(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.2,
                      height: 1.2,
                      color: onDartText
                          ? Constant.BLACK_COLOR
                          : Constant.WHITE_COLOR,
                    ),
                  ),
                  RichText(
                    maxLines: 3,
                    text: TextSpan(
                      text: homeworkName,
                      style: GoogleFonts.jost(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2,
                        height: 1.5,
                        color: onDartText
                            ? Constant.BLACK_COLOR
                            : Constant.WHITE_COLOR,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Constant.DEEP_BACKGROUND_COLOR,
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      Container(
                        width: 10 * progress,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Constant.BLUE_COLOR,
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _courseTitleComponent({
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        bottom: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.jost(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Constant.BLACK_COLOR,
            ),
          ),
          Container(),
        ],
      ),
    );
  }

  Widget _courseCard({
    required String img,
    required String level,
    required String teacherName,
    required String courseName,
  }) {
    return Container(
      width: 128,
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 96,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/$img.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 52,
                height: 12,
                decoration: BoxDecoration(
                  color: Constant.BACKGORUND_COLOR,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(6),
                  ),
                ),
                child: Text(
                  level,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.jost(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: level == "BEGINNER"
                        ? Constant.DEEP_BLUE_COLOR
                        : Constant.RED_COLOR,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            teacherName,
            style: GoogleFonts.jost(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: Constant.SUB_TEXT_COLOR,
            ),
          ),
          RichText(
            maxLines: 2,
            text: TextSpan(
              text: courseName,
              style: GoogleFonts.jost(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Constant.BLACK_COLOR,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: SvgPicture.asset(
                  'assets/svgs/filled_star.svg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: SvgPicture.asset(
                  'assets/svgs/filled_star.svg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: SvgPicture.asset(
                  'assets/svgs/filled_star.svg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: SvgPicture.asset(
                  'assets/svgs/unfilled_star.svg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: SvgPicture.asset(
                  'assets/svgs/unfilled_star.svg',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _masterClassTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Educat\ncoaching',
            style: GoogleFonts.jost(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Constant.BLACK_COLOR,
            ),
          ),
          Row(
            children: [
              Container(
                width: 56,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Constant.DEEP_BACKGROUND_COLOR,
                ),
                child: Center(
                  child: Text(
                    'GOLD',
                    style: GoogleFonts.jost(
                      fontSize: 9,
                      fontWeight: FontWeight.normal,
                      color: Constant.BLACK_COLOR,
                      letterSpacing: 4,
                    ),
                  ),
                ),
              ),
              Text(
                'MASTERCLASS',
                style: GoogleFonts.jost(
                  fontSize: 9,
                  fontWeight: FontWeight.normal,
                  color: Constant.BLACK_COLOR,
                  letterSpacing: 8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _masterClassBox() {
    return Stack(
      children: [
        SizedBox(
          width: Get.width,
          height: 288,
        ),
        Positioned(
          top: 88,
          child: Container(
            width: Get.width,
            height: 200,
            decoration: BoxDecoration(
              color: Constant.DEEP_BLUE_COLOR,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 135.0,
                bottom: 20,
                left: 125,
                right: 32,
              ),
              child: RichText(
                text: TextSpan(
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eros enim, dictum vitae quam nec, congue feugiat neque. Vivamus ut luctus enim.',
                  style: GoogleFonts.jost(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Constant.WHITE_COLOR,
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: Get.width * 0.9,
            height: 214,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage('assets/images/home_party.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 130,
                left: 100,
                right: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'by Dieter Rams',
                    style: GoogleFonts.jost(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Constant.WHITE_COLOR,
                    ),
                  ),
                  RichText(
                    maxLines: 3,
                    text: TextSpan(
                      text:
                          'How to travel and get paid in 2021 during Covid season',
                      style: GoogleFonts.jost(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Constant.WHITE_COLOR,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 180,
            left: 48,
          ),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Constant.DEEP_BLUE_COLOR,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 210 - 25,
            left: 78 - 25,
          ),
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/profile.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // logo & profile
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset('assets/svgs/logo.svg'),
                  ),
                  _profileWidget(),
                ]),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                _selectText(title: 'In Progress', selected: true),
                _selectText(title: 'Saved', selected: false),
                _selectText(title: 'Coaching', selected: false),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Constant.BLUE_COLOR,
                  ),
                ),
                Text(
                  'Homework',
                  style: GoogleFonts.jost(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Constant.SUB_TEXT_COLOR,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          //Homework card
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  _homeworkCard(
                    img: 'homework1',
                    teacherName: 'Dieter Rams',
                    homeworkName:
                        'A Simple Guide to Pricing Your Virtual Products',
                    progress: 3,
                  ),
                  _homeworkCard(
                    img: 'homework2',
                    teacherName: 'Dvorah Lansky',
                    homeworkName:
                        'Transform Your Action Journal into a 30-Day Challenge',
                    progress: 5,
                    onDartText: true,
                  ),
                  _homeworkCard(
                    img: 'homework2',
                    teacherName: 'Dvorah Lansky',
                    homeworkName:
                        'Transform Your Action Journal into a 30-Day Challenge',
                    progress: 5,
                    onDartText: true,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 34),
          _courseTitleComponent(title: 'WATCH HISTORY'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                _courseCard(
                  courseName: 'Illustrator 2021 MasterClass',
                  img: 'illustrator',
                  level: 'BEGINNER',
                  teacherName: 'Dieter Rams',
                ),
                _courseCard(
                  courseName: 'The Ultimate Drawing Course',
                  img: 'drawing',
                  level: 'ADVANCED',
                  teacherName: 'Dvorah Lansky',
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          _masterClassTitle(),
          const SizedBox(height: 12),
          _masterClassBox(),
          const SizedBox(height: 32),
          _courseTitleComponent(title: 'TRENDING NOW'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                _courseCard(
                  courseName: 'Illustrator 2021 MasterClass',
                  img: 'swimming',
                  level: 'BEGINNER',
                  teacherName: 'Dieter Rams',
                ),
                _courseCard(
                  courseName: 'The Ultimate Drawing Course',
                  img: 'drawing',
                  level: 'ADVANCED',
                  teacherName: 'Dvorah Lansky',
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _courseTitleComponent(title: 'BEST SKILLS'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                _courseCard(
                  courseName: 'Illustrator 2021 MasterClass',
                  img: 'swimming',
                  level: 'BEGINNER',
                  teacherName: 'Dieter Rams',
                ),
                _courseCard(
                  courseName: 'The Ultimate Drawing Course',
                  img: 'drawing',
                  level: 'ADVANCED',
                  teacherName: 'Dvorah Lansky',
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
