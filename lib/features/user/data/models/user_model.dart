class UserModel {
  final String id;
  final String name;
  final String age;
  bool liked;

  UserModel({
    required this.id,
    required this.name,
    required this.age,
    this.liked = false,
  });
}
