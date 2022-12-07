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
            height: widget.size.height * .68,
            width: widget.size.width * .194,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(widget.size.width * .00278),
            ),
            child: LayoutBuilder(builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.only(
                  top: constraints.maxHeight * .052,
                  left: constraints.maxWidth * .057,
                  right: constraints.maxWidth * .057,
                  bottom: constraints.maxHeight * .056,
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
                            radius: constraints.minWidth * .085,
                          ),
                          SizedBox(width: widget.size.width * .0111),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.user.name,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    color: AppColor.black1,
                                    fontSize: constraints.maxWidth * .071,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "@${state.user.login}",
                                style: TextStyle(
                                  fontSize: constraints.maxWidth * .05,
                                  color: AppColor.grey1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: constraints.minHeight * .0344),
                      Text(
                        state.user.bio,
                        style: TextStyle(
                          fontSize: constraints.maxWidth * .057,
                          color: AppColor.grey2,
                        ),
                      ),
                      SizedBox(height: constraints.minHeight * .0538),
                      InfoTile(
                          size: constraints.biggest,
                          iconPath: 'assets/icons/follwers.png',
                          title: '${state.user.followers} seguidores'),
                      InfoTile(
                          size: constraints.biggest,
                          iconPath: 'assets/icons/following.png',
                          title: '${state.user.following} seguindo'),
                      SizedBox(height: constraints.minHeight * .0344),
                      Visibility(
                        visible: state.user.company.isNotEmpty,
                        child: InfoTile(
                            size: constraints.biggest,
                            iconPath: 'assets/icons/company.png',
                            title: state.user.company),
                      ),
                      Visibility(
                        visible: state.user.location.isNotEmpty,
                        child: InfoTile(
                            size: constraints.biggest,
                            iconPath: 'assets/icons/location.png',
                            title: state.user.location),
                      ),
                      Visibility(
                        visible: state.user.email.isNotEmpty,
                        child: InfoTile(
                            size: constraints.biggest,
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
                            size: constraints.biggest,
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
                            size: constraints.biggest,
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
              );
            }),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
