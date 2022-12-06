import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petize_teste/modules/result/presenter/bloc/result_cubit.dart';
import 'package:petize_teste/modules/result/presenter/bloc/states/result_state.dart';
import 'package:petize_teste/utils/global_widgets/search_button.dart';
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
    controller.getUser(widget.user);
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
                    SearchDevsTitle(
                      fontSize: constraints.minHeight * .36,
                      margin: EdgeInsets.only(
                          top: constraints.minHeight * .25,
                          bottom: constraints.minHeight * .25,
                          left: constraints.minWidth * .078,
                          right: constraints.minWidth * .082),
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
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  BlocBuilder(
                    bloc: controller,
                    builder: (context, state) {
                      if (state is LoadingResultState) {
                        return const Center(
                          child: CircularProgressIndicator(
                              color: AppColor.purple1),
                        );
                      }

                      if (state is SuccessResultUserState) {
                        return const DevInfos();
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  const ContactButton(),
                ],
              ),
              const DevRepositories(),
            ],
          ),
        ],
      ),
    );
  }
}
