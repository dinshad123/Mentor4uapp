enum RoleSelection { mentor, mentee }

class MenteeModel {
  final String? id;
  final String? name;
  final String? field;
  final String? role;

  MenteeModel({
    this.id,
    this.name,
    this.role,
    this.field,
  });

// json to Usermodel
  factory MenteeModel.fromMap(Map<String, dynamic> json) {
    return MenteeModel(
      id: json['id'],
      name: json['name'],
      field: json['field'],
      role: json['role'],
    );
  }

  // usermodel to map

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'field': field,
      'name': name,
      'role': role,
    };
  }
}
