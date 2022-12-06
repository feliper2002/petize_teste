import 'dart:convert';

import 'package:http/http.dart';
import 'package:petize_teste/modules/result/infra/datasource/get_user_datasource.dart';

class GetUserDatasourceImpl implements GetUserDatasource {
  final Client client;

  GetUserDatasourceImpl(this.client);

  @override
  Future<Map<String, dynamic>> getUser(String user) async {
    const baseUrl = "https://api.github.com/users/";

    try {
      final response = await client.get(Uri.https("$baseUrl$user"));

      Map<String, dynamic>? data;

      if (response.statusCode == 200) {
        data = jsonDecode(response.body) as Map<String, dynamic>;
      }
      return data ?? {};
    } on ClientException catch (_) {
      throw Exception();
    }
  }
}