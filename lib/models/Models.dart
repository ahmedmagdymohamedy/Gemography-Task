class Repository {
  int id;
  String name;
  String description;
  String numberOfStars;
  String ownerName;
  String avatarURL;
  String htmlUrl;

  Repository({
    required this.id,
    required this.name,
    required this.description,
    required this.numberOfStars,
    required this.ownerName,
    required this.avatarURL,
    required this.htmlUrl,
  });
}
