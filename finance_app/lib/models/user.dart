class User {
  final int id;
  final String name;
  final String email;
  final String birthDate;
  final double amount;
  final String profession;
  final String createAt;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.birthDate,
    required this.amount,
    required this.profession,
    required this.createAt,
  });

  @override
  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'email': String email,
        'birth_date': String birthDate,
        'amount': double amount,
        'profession': String profession,
        'create_at': String createAt,
      } =>
      User(
          id:  id,
          name: name,
          email: email,
          birthDate: birthDate,
          amount:  amount,
          profession: profession,
          createAt: createAt,
      ),
    _ => throw const FormatException('Failed to load user.'),
    };
  }
  @override
  String toString() {
    return 'User {\n'
        '  id: $id,\n'
        '  name: $name,\n'
        '  email: $email,\n'
        '  birthDate: $birthDate,\n'
        '  amount: $amount,\n'
        '  profession: $profession,\n'
        '  createAt: $createAt,\n'
        '}';
  }
}