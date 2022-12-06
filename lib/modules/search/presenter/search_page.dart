import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petize_teste/modules/search/presenter/widgets/search_devs_title.dart';
import 'package:petize_teste/modules/search/presenter/widgets/search_input.dart';
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

    @override
    void initState() {
      searchController.addListener(() {
        setState(() {});
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SearchDevsTitle(size: size),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchInput(controller: searchController, size: size),
              TextButton(
                onPressed: () {
                  if (searchController.text.isNotEmpty) {
                    Modular.to
                        .navigate("/result/", arguments: searchController.text);
                  }
                },
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
