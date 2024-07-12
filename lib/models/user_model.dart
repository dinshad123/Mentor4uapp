enum RoleSelection { mentor, mentee }

class UserModel {
  final String? id;
  final String? name;
  RoleSelection? role = null;

  UserModel({
    this.id,
    this.name,
    this.role,
  });

// json to Usermodel
  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      role: json['role'],
    );
  }

  // usermodel to map

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'role': role.toString().split('.').last,
    };
  }
}
