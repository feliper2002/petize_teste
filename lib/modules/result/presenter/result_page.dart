import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petize_teste/modules/result/presenter/bloc/result_cubit.dart';
import 'package:petize_teste/utils/themes/app_color.dart';
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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColor.titleBlue),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DevInfos(size: size, user: widget.user),
            DevRepositories(size: size, user: widget.user),
          ],
        ),
      ),
    );
  }
}
