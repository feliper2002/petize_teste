class User {
  final String login;
  final String name;
  final String bio;
  final String twitterUsername;
  final String location;
  final String blog;
  final bool siteAdmin;
  final String company;
  final String email;
  final int following;
  final int followers;
  User({
    required this.login,
    required this.name,
    required this.bio,
    required this.twitterUsername,
    required this.location,
    required this.blog,
    required this.siteAdmin,
    required this.company,
    required this.email,
    required this.following,
    required this.followers,
  });
}
