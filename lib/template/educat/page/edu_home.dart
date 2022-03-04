import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // logo & profile
          Row(
            children: [],
          ),

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
                  color: const Color(0xFF2EAFBE),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Homework',
                style: GoogleFonts.jost(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFB9B5A8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
