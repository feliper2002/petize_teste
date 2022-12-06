import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petize_teste/modules/result/presenter/bloc/result_bloc.dart';
import 'package:petize_teste/modules/result/presenter/bloc/states/result_state.dart';

class ResultPage extends StatefulWidget {
  final String user;
  const ResultPage({super.key, required this.user});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final controller = Modular.get<ResultBloc>();

  @override
  void initState() {
    controller.getUser(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: controller,
        builder: (context, state) {
          if (state is SuccessResultUserState) {
            return Center(
              child: Text(state.user.name),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
