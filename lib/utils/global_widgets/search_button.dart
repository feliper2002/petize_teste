import 'package:flutter/material.dart';

import '../themes/app_color.dart';

class SearchButton extends StatelessWidget {
  final Size size;
  final Function onPressed;
  const SearchButton({super.key, required this.size, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed as void Function(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColor.purple1),
        fixedSize: MaterialStateProperty.all(
            Size(size.width * .12, size.height * .047)),
      ),
      child: const Text("Search",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18)),
    );
  }
}
