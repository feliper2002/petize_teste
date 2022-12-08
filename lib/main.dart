import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petize_teste/modules/app/app_module.dart';
import 'package:petize_teste/modules/app/app_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() {
  timeago.setLocaleMessages('ptbr', timeago.PtBrMessages());

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
