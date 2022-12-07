import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petize_teste/utils/global_widgets/search_devs_title.dart';
import 'package:petize_teste/utils/global_widgets/search_input.dart';
import 'package:petize_teste/utils/themes/app_color.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SearchDevsTitle(
            fontSize: size.width * .121,
            margin: EdgeInsets.only(
                top: size.height * .39, bottom: size.height * .08),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchInput(
                controller: searchController,
                size: size,
                borderColor: AppColor.darkGrey,
                focusedColorBorder: AppColor.purple1,
                iconColor: AppColor.darkGrey,
                hintText: "Search",
                hintStyle:
                    const TextStyle(fontSize: 18, color: AppColor.darkGrey),
                onFieldSubmitted: (value) async {
                  await Modular.to
                      .pushNamed("/result/", arguments: searchController.text);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
