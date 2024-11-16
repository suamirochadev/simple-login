class UserEntitie {
  UserEntitie({
    required this.message,
    this.password,
  });

  final String? password;
  final String message;

  factory UserEntitie.fromMap(Map<String, dynamic> map) {
    return UserEntitie(
      message: map['message'] ?? '',
      password: map['password'],
    );
  }
}
