import 'package:flutter/material.dart';
import 'package:petize_teste/modules/search/presenter/widgets/search_devs_title.dart';
import 'package:petize_teste/modules/search/presenter/widgets/search_input.dart';
import 'package:petize_teste/utils/themes/app_color.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SearchDevsTitle(size: size),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchInput(controller: TextEditingController(), size: size),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColor.purple1),
                  fixedSize: MaterialStateProperty.all(
                      Size(size.width * .12, size.height * .047)),
                ),
                child: const Text("Search",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
