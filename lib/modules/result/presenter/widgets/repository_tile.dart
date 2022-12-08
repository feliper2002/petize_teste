import 'package:flutter/material.dart';
import 'package:petize_teste/modules/result/domain/entities/git_repository.dart';
import 'package:petize_teste/utils/functions/custom_launch_url.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/themes/app_color.dart';
import 'package:timeago/timeago.dart' as timeago;

class RepositoryTile extends StatelessWidget {
  final Size size;
  final GitRepository repo;
  const RepositoryTile({super.key, required this.size, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: size.height * .0179, horizontal: size.width * .0388),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
              await customLaunchUrl(repo.url);
            },
            child: Text(
              repo.name,
              style: TextStyle(
                  fontSize: size.width * .04854,
                  color: AppColor.black1,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: size.height * .0156),
          Text(
            repo.description,
            style:
                TextStyle(fontSize: size.width * .0388, color: AppColor.grey2),
          ),
          SizedBox(height: size.height * .0156),
          Row(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/icons/favorite.png",
                    height: size.height * .027,
                    width: size.width * .058,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${repo.stargazersCount}",
                    style: TextStyle(
                        fontSize: size.width * .034, color: AppColor.grey2),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "•",
                    style: TextStyle(
                        fontSize: size.width * .034, color: AppColor.grey2),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              Text(
                "Atualizado ${timeago.format(DateTime.parse(repo.updatedAt), locale: 'ptbr')}",
                style: TextStyle(
                    fontSize: size.width * .034, color: AppColor.grey2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
