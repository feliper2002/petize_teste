import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:petize_teste/modules/result/external/datasources/get_user_datasource_impl.dart';

class ClientMock extends Mock implements Client {}

void main() {
  late ClientMock client;
  late GetUserDatasourceImpl datasource;

  setUpAll(() {
    client = ClientMock();
    datasource = GetUserDatasourceImpl(client);
  });

  test(
      'Should return a Map<String, dynamic> by parging user string to Github API service',
      () async {
    when(() => client.get(Uri.parse("https://api.github.com/users/pessoaDev")))
        .thenAnswer((_) async => Future.value(Response(_body, 200)));

    final response = await datasource.getUser("pessoaDev");

    expect(response, isA<Map<String, dynamic>>());
  });
}

const _body =
    '''{
  "login": "pessoaTeste",
  "id": 983249,
  "node_id": "e23jej3enb3je",
  "avatar_url": "https://avatars.githubusercontent.com/u/983249?v=4",
  "gravatar_id": "",
  "url": "https://api.github.com/users/pessoaTeste",
  "html_url": "https://github.com/pessoaTeste",
  "followers_url": "https://api.github.com/users/pessoaTeste/followers",
  "following_url":
      "https://api.github.com/users/pessoaTeste/following{/other_user}",
  "gists_url": "https://api.github.com/users/pessoaTeste/gists{/gist_id}",
  "starred_url":
      "https://api.github.com/users/pessoaTeste/starred{/owner}{/repo}",
  "subscriptions_url": "https://api.github.com/users/pessoaTeste/subscriptions",
  "organizations_url": "https://api.github.com/users/pessoaTeste/orgs",
  "repos_url": "https://api.github.com/users/pessoaTeste/repos",
  "events_url": "https://api.github.com/users/pessoaTeste/events{/privacy}",
  "received_events_url":
      "https://api.github.com/users/pessoaTeste/received_events",
  "type": "User",
  "site_admin": false,
  "name": "Pessoa Teste",
  "company": null,
  "blog": "",
  "location": "Petrolina PE, Brasil",
  "email": null,
  "hireable": true,
  "bio": "Bio",
  "twitter_username": "pessoa_dev",
  "public_repos": 47,
  "public_gists": 0,
  "followers": 144,
  "following": 289,
  "created_at": "2019-01-04T02:03:50Z",
  "updated_at": "2022-04-03T22:33:55Z"
}''';
