import 'package:flutter/material.dart';
import 'package:petize_teste/utils/themes/app_color.dart';

class SearchDevsTitle extends StatelessWidget {
  final Size size;
  const SearchDevsTitle({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin:
          EdgeInsets.only(top: size.height * .39, bottom: size.height * .08),
      child: const Text.rich(TextSpan(
        text: 'Search ',
        style: TextStyle(
            color: AppColor.titleBlue,
            fontWeight: FontWeight.w700,
            fontSize: 80),
        children: [
          TextSpan(
            text: 'd_evs',
            style: TextStyle(
                color: AppColor.purple1,
                fontWeight: FontWeight.w700,
                fontSize: 80),
          ),
        ],
      )),
    );
  }
}
