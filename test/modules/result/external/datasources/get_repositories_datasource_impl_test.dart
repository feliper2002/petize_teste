import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:petize_teste/modules/result/external/datasources/get_repositories_datasource_impl.dart';
import 'package:petize_teste/modules/result/infra/datasource/get_repositories_datasource.dart';

class ClientMock extends Mock implements Client {}

void main() {
  late ClientMock client;
  late GetRepositoriesDatasource datasource;

  setUpAll(() {
    client = ClientMock();
    datasource = GetRepositoriesDatasourceImpl(client);
  });

  test(
      'Should return a List of Map<String, dynamic> by parging user string to Github API service',
      () async {
    when(() => client
            .get(Uri.parse("https://api.github.com/users/pessoaDev/repos")))
        .thenAnswer((_) async => Future.value(Response(_body, 200)));

    final response = await datasource.getRepositories("pessoaDev");

    expect(response, isA<List<Map<String, dynamic>>>());
  });
}

const _body =
    '''[
  {
    "id": 2794992981399,
    "node_id": "MDEwOlJlGHJJH33jlllvcnkyNzk0ODEzOTk=",
    "name": "100daysofcode-1",
    "full_name": "pessoaTeste/100daysofcode-1",
    "private": false,
    "owner": {
      "login": "pessoaTeste",
      "id": 6462323293392373,
      "node_id": "MDQ6VXNlcjY0NjIzMjcz",
      "avatar_url":
          "https://avatars.githubusercontent.com/u/646232882839273?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/pessoaTeste",
      "html_url": "https://github.com/pessoaTeste",
      "followers_url": "https://api.github.com/users/pessoaTeste/followers",
      "following_url":
          "https://api.github.com/users/pessoaTeste/following{/other_user}",
      "gists_url": "https://api.github.com/users/pessoaTeste/gists{/gist_id}",
      "starred_url":
          "https://api.github.com/users/pessoaTeste/starred{/owner}{/repo}",
      "subscriptions_url":
          "https://api.github.com/users/pessoaTeste/subscriptions",
      "organizations_url": "https://api.github.com/users/pessoaTeste/orgs",
      "repos_url": "https://api.github.com/users/pessoaTeste/repos",
      "events_url": "https://api.github.com/users/pessoaTeste/events{/privacy}",
      "received_events_url":
          "https://api.github.com/users/pessoaTeste/received_events",
      "type": "User",
      "site_admin": false
    },
    "html_url": "https://github.com/pessoaTeste/100daysofcode-1",
    "description":
        "Repositório direcionado para os projetos do desafio #100daysofcode",
    "fork": false,
    "url": "https://api.github.com/repos/pessoaTeste/100daysofcode-1",
    "forks_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/forks",
    "keys_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/keys{/key_id}",
    "collaborators_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/collaborators{/collaborator}",
    "teams_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/teams",
    "hooks_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/hooks",
    "issue_events_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/issues/events{/number}",
    "events_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/events",
    "assignees_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/assignees{/user}",
    "branches_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/branches{/branch}",
    "tags_url": "https://api.github.com/repos/pessoaTeste/100daysofcode-1/tags",
    "blobs_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/git/blobs{/sha}",
    "git_tags_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/git/tags{/sha}",
    "git_refs_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/git/refs{/sha}",
    "trees_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/git/trees{/sha}",
    "statuses_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/statuses/{sha}",
    "languages_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/languages",
    "stargazers_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/stargazers",
    "contributors_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/contributors",
    "subscribers_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/subscribers",
    "subscription_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/subscription",
    "commits_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/commits{/sha}",
    "git_commits_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/git/commits{/sha}",
    "comments_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/comments{/number}",
    "issue_comment_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/issues/comments{/number}",
    "contents_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/contents/{+path}",
    "compare_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/compare/{base}...{head}",
    "merges_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/merges",
    "archive_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/{archive_format}{/ref}",
    "downloads_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/downloads",
    "issues_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/issues{/number}",
    "pulls_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/pulls{/number}",
    "milestones_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/milestones{/number}",
    "notifications_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/notifications{?since,all,participating}",
    "labels_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/labels{/name}",
    "releases_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/releases{/id}",
    "deployments_url":
        "https://api.github.com/repos/pessoaTeste/100daysofcode-1/deployments",
    "created_at": "2020-07-14T04:28:23Z",
    "updated_at": "2022-03-28T01:15:14Z",
    "pushed_at": "2020-11-01T01:50:10Z",
    "git_url": "git://github.com/pessoaTeste/100daysofcode-1.git",
    "ssh_url": "git@github.com:pessoaTeste/100daysofcode-1.git",
    "clone_url": "https://github.com/pessoaTeste/100daysofcode-1.git",
    "svn_url": "https://github.com/pessoaTeste/100daysofcode-1",
    "homepage": null,
    "size": 5228,
    "stargazers_count": 1,
    "watchers_count": 1,
    "language": "Python",
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": false,
    "has_discussions": false,
    "forks_count": 0,
    "mirror_url": null,
    "archived": false,
    "disabled": false,
    "open_issues_count": 0,
    "license": null,
    "allow_forking": true,
    "is_template": false,
    "web_commit_signoff_required": false,
    "topics": [],
    "visibility": "public",
    "forks": 0,
    "open_issues": 0,
    "watchers": 1,
    "default_branch": "master"
  }
]''';
