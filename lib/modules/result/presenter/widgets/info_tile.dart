import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final Size size;
  final String iconPath;
  final String title;
  const InfoTile(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            height: size.height * .0516,
            width: size.width * .085,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: size.width * .05,
            ),
          ),
        ],
      ),
    );
  }
}
