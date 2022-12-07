import 'package:flutter/material.dart';
import 'package:petize_teste/utils/themes/app_color.dart';

class SearchDevsTitle extends StatelessWidget {
  final double fontSize;
  final EdgeInsets? margin;
  const SearchDevsTitle({super.key, required this.fontSize, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: margin,
      child: Text.rich(
        TextSpan(
          text: 'Search ',
          style: TextStyle(
            color: AppColor.titleBlue,
            fontWeight: FontWeight.w700,
            fontSize: fontSize,
            fontFamily: 'Nunito',
          ),
          children: [
            TextSpan(
              text: 'd_evs',
              style: TextStyle(
                color: AppColor.purple1,
                fontWeight: FontWeight.w700,
                fontSize: fontSize,
                fontFamily: 'Nunito',
              ),
            ),
          ],
        ),
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
