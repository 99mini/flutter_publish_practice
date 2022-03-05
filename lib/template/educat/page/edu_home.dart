import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:publish_practice/template/educat/constant/constant.dart';

class EduHome extends StatelessWidget {
  const EduHome({Key? key}) : super(key: key);

  Widget _selectText({
    required String title,
    required bool selected,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: Text(
        title,
        style: GoogleFonts.jost(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: selected ? Colors.black : const Color(0xFFB9B5A8),
        ),
      ),
    );
  }

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

  Widget _homeworkCard({
    required String img,
    required String teacherName,
    required String homeworkName,
  }) {
    return Stack(
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
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  teacherName,
                  style: GoogleFonts.jost(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                RichText(
                  maxLines: 3,
                  text: TextSpan(
                    text: homeworkName,
                    style: GoogleFonts.jost(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // logo & profile
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SvgPicture.asset('assets/svgs/logo.svg'),
            _profileWidget(),
          ]),
          const SizedBox(height: 24),
          Row(
            children: [
              _selectText(title: 'In Progress', selected: true),
              _selectText(title: 'Saved', selected: false),
              _selectText(title: 'Coaching', selected: false),
            ],
          ),
          const SizedBox(height: 12),
          Column(
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
          const SizedBox(height: 10),
          //Homework card
          _homeworkCard(
            img: 'homework1',
            teacherName: 'Dieter Rams',
            homeworkName: 'A Simple Guide to Pricing Your Virtual Products',
          ),
        ],
      ),
    );
  }
}
