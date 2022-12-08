import 'dart:convert';

import 'package:http/http.dart';

import '../../../../utils/constants/api_base_url.dart';
import '../../infra/datasource/get_repositories_datasource.dart';
import '../../infra/errors/result_failure.dart';

class GetRepositoriesDatasourceImpl implements GetRepositoriesDatasource {
  final Client client;

  GetRepositoriesDatasourceImpl(this.client);

  @override
  Future<List<Map<String, dynamic>>> getRepositories(String user) async {
    try {
      final response = await client.get(Uri.parse("$apiBaseURL$user/repos"));

      List<Map<String, dynamic>> data = [];

      if (response.statusCode == 200) {
        for (var e in (jsonDecode(response.body) as List)) {
          data.add(e);
        }
      }
      return data;
    } on ClientException catch (e) {
      throw GitRepositoryDataServiceFailure(e.message);
    } catch (e) {
      throw GitRepositoryDataServiceFailure(
          "Não foi possível carregar os dados dos repositórios!");
    }
  }
}
