import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petize_teste/modules/result/presenter/widgets/info_tile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/themes/app_color.dart';
import '../bloc/result_cubit.dart';
import '../bloc/states/result_state.dart';

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
            height: widget.size.height * .35,
            padding: EdgeInsets.only(
              left: widget.size.width * .0388,
              top: widget.size.height * .027,
              right: widget.size.width * .04854,
            ),
            decoration: BoxDecoration(
              color: AppColor.lightGrey2,
            ),
            child: SingleChildScrollView(
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
                  SizedBox(height: widget.size.height * .0344),
                  Text(
                    state.user.bio,
                    style: TextStyle(
                      fontSize: widget.size.width * .0388,
                      color: AppColor.grey2,
                    ),
                  ),
                  SizedBox(
                    width: widget.size.width,
                    height: 100,
                    child: GridView(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 0.3,
                        childAspectRatio: 5.5,
                      ),
                      children: [
                        Visibility(
                          visible: state.user.company.isNotEmpty,
                          child: InfoTile(
                              size: widget.size,
                              iconPath: 'assets/icons/company.png',
                              title: state.user.company),
                        ),
                        Visibility(
                          visible: state.user.location.isNotEmpty,
                          child: InfoTile(
                              size: widget.size,
                              iconPath: 'assets/icons/location.png',
                              title: state.user.location),
                        ),
                        Visibility(
                          visible: state.user.email.isNotEmpty,
                          child: InfoTile(
                              size: widget.size,
                              iconPath: 'assets/icons/email.png',
                              onTap: () async {
                                if (await canLaunchUrl(
                                    Uri.parse("mailto:${state.user.email}"))) {
                                  await launchUrl(
                                      Uri.parse("mailto:${state.user.email}"));
                                }
                              },
                              title: state.user.email),
                        ),
                        Visibility(
                          visible: state.user.blog.isNotEmpty,
                          child: InfoTile(
                              size: widget.size,
                              iconPath: 'assets/icons/blog.png',
                              onTap: () async {
                                if (await canLaunchUrl(
                                    Uri.parse(state.user.blog))) {
                                  await launchUrl(Uri.parse(state.user.blog));
                                }
                              },
                              title: state.user.blog),
                        ),
                        Visibility(
                          visible: state.user.twitterUsername.isNotEmpty,
                          child: InfoTile(
                              size: widget.size,
                              iconPath: 'assets/icons/twitter.png',
                              onTap: () async {
                                if (await canLaunchUrl(Uri.parse(
                                    "https://twitter.com/${state.user.twitterUsername}"))) {
                                  await launchUrl(Uri.parse(
                                      "https://twitter.com/${state.user.twitterUsername}"));
                                }
                              },
                              title: '@${state.user.twitterUsername}'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
