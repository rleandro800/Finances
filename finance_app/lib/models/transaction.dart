class Transaction {
  final bool isDebt;
  final double value;
  final String description;
  final String userName;
  final String createAt;

  const Transaction({
    required this.isDebt,
    required this.description,
    required this.userName,
    required this.value,
    required this.createAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'is_debt': bool isDebt,
      'description': String description,
      'user_name': String userName,
      'value': double value,
      'create_at': String createAt,
      } =>
          Transaction(
            isDebt: isDebt,
            description: description.toUpperCase(),
            userName: userName,
            value:  value,
            createAt: createAt,
          ),
      _ => throw const FormatException('Failed to load Transaction.'),
    };
  }
  @override
  String toString() {
    return 'Transaction {\n'
        '  isDebt: $isDebt,\n'
        '  description: $description,\n'
        '  userName: $userName,\n'
        '  value: $value,\n'
        '  createAt: $createAt,\n'
        '}';
  }
}