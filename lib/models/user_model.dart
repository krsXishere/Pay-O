class UserModel {
  int? id;
  String? name, email, password, phone;
  DateTime? createdAt, updatedAt, deletedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> object) {
    return UserModel(
      id: object['ID'],
      name: object['Name'],
      email: object['Email'],
      password: object['Password'],
      phone: object['Phone'].toString(),
      createdAt: DateTime.parse(object['CreatedAt']),
      updatedAt: DateTime.parse(object['UpdatedAt']),
      deletedAt: DateTime.parse(object['DeletedAt']),
    );
  }
}
