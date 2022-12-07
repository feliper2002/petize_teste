import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petize_teste/modules/result/presenter/bloc/result_cubit.dart';
import 'package:petize_teste/utils/global_widgets/search_devs_title.dart';
import 'package:petize_teste/utils/themes/app_color.dart';

import '../../../utils/global_widgets/search_input.dart';
import 'widgets/contact_button.dart';
import 'widgets/dev_infos.dart';
import 'widgets/dev_repositories.dart';

class ResultPage extends StatefulWidget {
  final String user;
  const ResultPage({super.key, required this.user});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final controller = Modular.get<ResultBloc>();

  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * .078,
            width: size.width,
            color: Colors.white,
            child: LayoutBuilder(
              builder: (_, constraints) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Modular.to.navigate("/");
                      },
                      child: SearchDevsTitle(
                        fontSize: constraints.minHeight * .36,
                        margin: EdgeInsets.only(
                            top: constraints.minHeight * .25,
                            bottom: constraints.minHeight * .25,
                            left: constraints.minWidth * .078,
                            right: constraints.minWidth * .082),
                      ),
                    ),
                    SearchInput(
                      controller: searchController,
                      size: size,
                      borderColor: AppColor.purple1,
                      focusedColorBorder: AppColor.purple1,
                      iconColor: Colors.grey[200]!,
                      hintText: "Search",
                      hintStyle:
                          TextStyle(fontSize: 18, color: Colors.grey[200]),
                      onFieldSubmitted: () async {
                        Modular.to.navigate("/result/",
                            arguments: searchController.text);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: size.height * .085, left: size.width * .078),
            child: Row(
              children: [
                Column(
                  children: [
                    DevInfos(size: size, user: widget.user),
                    ContactButton(
                      size: size,
                      onPressed: () {},
                    ),
                  ],
                ),
                DevRepositories(size: size, user: widget.user),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
