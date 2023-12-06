class User {
  final String name;
  final String companyName;

  User({required this.name, required this.companyName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      companyName: json['companyName'],
    );
  }
}
