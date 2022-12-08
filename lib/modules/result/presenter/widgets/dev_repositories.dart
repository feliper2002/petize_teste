import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petize_teste/modules/result/presenter/bloc/result_cubit.dart';
import 'package:petize_teste/modules/result/presenter/bloc/states/result_state.dart';
import 'package:petize_teste/modules/result/presenter/widgets/repository_tile.dart';
import 'package:petize_teste/utils/themes/app_color.dart';

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
                    return RepositoryTile(size: widget.size, repo: repo);
                  },
                ),
              );
            }
          }
          return const SizedBox.shrink();
        });
  }
}
