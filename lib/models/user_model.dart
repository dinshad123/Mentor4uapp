class UserModel {
  final String? id;
  final String email;
  final String password;

  UserModel({
    this.id,
    required this.email,
    required this.password,
  });
// json to Usermodel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'], email: json['email'], password: json['password']);
  }

  // usermodel to map

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
    };
  }
}
