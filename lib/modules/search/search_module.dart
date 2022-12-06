import 'package:flutter_modular/flutter_modular.dart';
import 'package:petize_teste/modules/search/presenter/search_page.dart';

class SearchModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const SearchPage()),
      ];
}
