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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(widget.size.width * .00278),
                ),
                height: widget.size.height * .5,
                child: ListView.separated(
                  itemCount: state.repositories.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 1,
                      indent: widget.size.width * .027,
                      endIndent: widget.size.width * .027,
                      color: AppColor.lightGrey,
                    );
                  },
                  itemBuilder: (context, index) {
                    final repo = state.repositories[index];
                    return Container(
                      margin: EdgeInsets.symmetric(
                          vertical: widget.size.height * .0179,
                          horizontal: widget.size.width * .0388),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            repo.name,
                            style: TextStyle(
                                fontSize: widget.size.width * .04854,
                                color: AppColor.black1,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: widget.size.height * .0156),
                          Text(
                            repo.description,
                            style: TextStyle(
                                fontSize: widget.size.width * .0388,
                                color: AppColor.grey2),
                          ),
                          SizedBox(height: widget.size.height * .0156),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/favorite.png",
                                    height: widget.size.height * .027,
                                    width: widget.size.width * .058,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "${repo.stargazersCount}",
                                    style: TextStyle(
                                        fontSize: widget.size.width * .034,
                                        color: AppColor.grey2),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "•",
                                    style: TextStyle(
                                        fontSize: widget.size.width * .034,
                                        color: AppColor.grey2),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                              Text(
                                "Atualizado ${timeago.format(DateTime.parse(repo.updatedAt), locale: 'ptbr')}",
                                style: TextStyle(
                                    fontSize: widget.size.width * .034,
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
