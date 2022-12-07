import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petize_teste/modules/result/presenter/widgets/info_tile.dart';

import '../../../../utils/themes/app_color.dart';
import '../bloc/result_cubit.dart';
import '../bloc/states/result_state.dart';
import 'info_grid.dart';

class DevInfos extends StatefulWidget {
  final Size size;
  final String user;
  const DevInfos({super.key, required this.size, required this.user});

  @override
  State<DevInfos> createState() => _DevInfosState();
}

class _DevInfosState extends State<DevInfos> {
  final controller = Modular.get<ResultBloc>();

  @override
  void initState() {
    controller.getUser(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: controller,
      builder: (context, state) {
        if (state is LoadingResultState) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.purple1),
          );
        }

        if (state is SuccessResultUserState) {
          return Container(
            padding: EdgeInsets.only(
              left: widget.size.width * .0388,
              top: widget.size.height * .027,
              right: widget.size.width * .04854,
            ),
            decoration: BoxDecoration(
              color: AppColor.lightGrey2,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      backgroundImage:
                          Image.network(state.user.avatarUrl).image,
                      radius: widget.size.width * .058,
                    ),
                    SizedBox(width: widget.size.width * .0388),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.name,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: AppColor.black1,
                              fontSize: widget.size.width * .048,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "@${state.user.login}",
                          style: TextStyle(
                            fontSize: widget.size.width * .034,
                            color: AppColor.grey3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: widget.size.height * .019),
                Row(
                  children: [
                    InfoTile(
                        size: widget.size,
                        iconPath: 'assets/icons/follwers.png',
                        title: '${state.user.followers} seguidores'),
                    InfoTile(
                        size: widget.size,
                        iconPath: 'assets/icons/following.png',
                        title: '${state.user.following} seguindo'),
                  ],
                ),
                SizedBox(height: widget.size.height * .029),
                Text(
                  state.user.bio,
                  style: TextStyle(
                    fontSize: widget.size.width * .0388,
                    color: AppColor.grey2,
                  ),
                ),
                SizedBox(height: widget.size.height * .028),
                SizedBox(
                  width: widget.size.width,
                  height: 100,
                  child: InfoGrid(
                    size: widget.size,
                    user: state.user,
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
