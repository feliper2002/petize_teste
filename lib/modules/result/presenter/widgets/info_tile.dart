import 'package:flutter/material.dart';
import 'package:petize_teste/utils/themes/app_color.dart';

class InfoTile extends StatelessWidget {
  final Size size;
  final String iconPath;
  final String title;
  final Function? onTap;
  const InfoTile(
      {super.key,
      this.onTap,
      required this.iconPath,
      required this.title,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          height: size.height * .027,
          width: size.width * .058,
        ),
        GestureDetector(
          onTap: onTap as void Function()?,
          child: Flexible(
            child: Text(
              title,
              style: TextStyle(
                fontSize: size.width * .034,
                color: AppColor.grey2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
