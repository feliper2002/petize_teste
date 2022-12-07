import 'package:flutter/material.dart';

import '../../../../utils/themes/app_color.dart';

class ContactButton extends StatelessWidget {
  final Size size;
  final Function onPressed;
  const ContactButton({super.key, required this.size, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.height * .039),
      child: TextButton(
        onPressed: onPressed as void Function(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColor.purple1),
          fixedSize: MaterialStateProperty.all(
              Size(size.width * .194, size.height * .047)),
        ),
        child: const Text("Contato",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18)),
      ),
    );
  }
}
