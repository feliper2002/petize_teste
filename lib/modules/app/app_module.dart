import 'package:flutter_modular/flutter_modular.dart';

import '../result/result_module.dart';
import '../search/search_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SearchModule()),
        ModuleRoute('/result', module: ResultModule()),
      ];
}
