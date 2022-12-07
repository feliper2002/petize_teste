import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petize_teste/modules/result/presenter/bloc/result_cubit.dart';
import 'package:petize_teste/modules/result/presenter/bloc/states/result_state.dart';

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
                color: Colors.white,
                width: widget.size.width * .627,
                child: ListView.builder(
                  itemCount: state.repositories.length,
                  itemBuilder: (context, index) {
                    final repo = state.repositories[index];
                    return SizedBox(
                      child: Text(repo.name),
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
