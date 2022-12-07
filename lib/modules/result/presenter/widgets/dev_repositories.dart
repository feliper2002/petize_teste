import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petize_teste/modules/result/presenter/bloc/result_cubit.dart';
import 'package:petize_teste/modules/result/presenter/bloc/states/result_state.dart';
import 'package:petize_teste/utils/themes/app_color.dart';

import 'package:timeago/timeago.dart' as timeago;

class DevRepositories extends StatefulWidget {
  final Size size;
  final String user;
  const DevRepositories({super.key, required this.size, required this.user});

  @override
  State<DevRepositories> createState() => _DevRepositoriesState();
}

class _DevRepositoriesState extends State<DevRepositories> {
  final controller = Modular.get<ResultBloc>();

  @override
  void initState() {
    controller.getRepositories(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: controller,
        builder: (context, state) {
          if (state is SuccessResultReposState) {
            if (state.repositories.isNotEmpty) {
              return Container(
                margin: EdgeInsets.only(left: widget.size.width * .022),
                padding: EdgeInsets.symmetric(
                  vertical: widget.size.height * .023,
                  horizontal: widget.size.width * .01666,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(widget.size.width * .00278),
                ),
                height: widget.size.height * .78,
                width: widget.size.width * .627,
                child: ListView.separated(
                  itemCount: state.repositories.length,
                  separatorBuilder: (context, index) {
                    return LayoutBuilder(builder: (context, cnst) {
                      return Divider(
                        thickness: 1,
                        indent: cnst.maxWidth * .027,
                        endIndent: cnst.maxWidth * .027,
                        color: AppColor.lightGrey,
                      );
                    });
                  },
                  itemBuilder: (context, index) {
                    final repo = state.repositories[index];
                    return Container(
                      margin: EdgeInsets.symmetric(
                          vertical: widget.size.height * .0156),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            repo.name,
                            style: TextStyle(
                                fontSize: widget.size.width * .0138,
                                color: AppColor.black1,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: widget.size.height * .0156),
                          Text(
                            repo.description,
                            style: TextStyle(
                                fontSize: widget.size.width * .011,
                                color: AppColor.grey2),
                          ),
                          SizedBox(height: widget.size.height * .0156),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/favorite.png",
                                    height: widget.size.width * .01666,
                                    width: widget.size.width * .01666,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "${repo.stargazersCount}",
                                    style: TextStyle(
                                        fontSize: widget.size.width * .011,
                                        color: AppColor.grey2),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "•",
                                    style: TextStyle(
                                        fontSize: widget.size.width * .011,
                                        color: AppColor.grey2),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                              Text(
                                "Atualizado ${timeago.format(DateTime.parse(repo.updatedAt), locale: 'ptbr')}",
                                style: TextStyle(
                                    fontSize: widget.size.width * .011,
                                    color: AppColor.grey2),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          }
          return const SizedBox.shrink();
        });
  }
}
