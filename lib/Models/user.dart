class User {
  late final int id;
  late final String name;
  late final String email;
  // late final String phone;
  late final String password;
  // late final String avatar;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    print(json);
    // print(json);
    id = json['id'];
    // print(json);
    name = json['name'];
    password = json['user_password'];
    email = json['email'];

    // print(json['expires']);
    // print('tmam');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['user_password'] = password;
    data['email'] = email;
    return data;
  }
}
