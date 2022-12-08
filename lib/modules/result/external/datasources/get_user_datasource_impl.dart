import 'dart:convert';

import 'package:http/http.dart';
import 'package:petize_teste/modules/result/infra/datasource/get_user_datasource.dart';
import 'package:petize_teste/modules/result/infra/errors/user_failure.dart';

import '../../../../utils/constants/api_base_url.dart';

class GetUserDatasourceImpl implements GetUserDatasource {
  final Client client;

  GetUserDatasourceImpl(this.client);

  @override
  Future<Map<String, dynamic>> getUser(String user) async {
    try {
      final response = await client.get(Uri.parse("$apiBaseURL$user"));

      Map<String, dynamic>? data;

      if (response.statusCode == 200) {
        data = jsonDecode(response.body) as Map<String, dynamic>;
      }
      return data ?? {};
    } on ClientException catch (e) {
      throw UserDataServiceFailure(e.message);
    } catch (e) {
      throw UserDataServiceFailure(
          "Não foi possível carregar os dados do usuário!");
    }
  }
}
