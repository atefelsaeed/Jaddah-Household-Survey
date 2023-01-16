class User {
  late final int id;
  late final String name;
  late final String email;
  late final String password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['password'] = password;
    data['email'] = email;
    return data;
  }
}
