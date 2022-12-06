import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/result_page.dart';

class ResultModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const ResultPage()),
      ];
}
