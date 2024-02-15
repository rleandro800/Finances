class Transaction {
  final int? id;
  final bool isDebt;
  final double value;
  final String description;
  final int userId;
  final String? createAt;

  const Transaction({
    required this.id,
    required this.isDebt,
    required this.description,
    required this.userId,
    required this.value,
    required this.createAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id': int id,
      'is_debt': bool isDebt,
      'description': String description,
      'user_id': int userId,
      'value': double value,
      'create_at': String createAt,
      } =>
          Transaction(
            id: id,
            isDebt: isDebt,
            description: description.toUpperCase(),
            userId: userId,
            value:  value,
            createAt: createAt,
          ),
      _ => throw const FormatException('Failed to load Transaction.'),
    };
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'is_debt': isDebt,
      'value': value,
      'description': description,
      'user': userId
    };
    return map;
  }

  @override
  String toString() {
    return '{\n'
          '"is_debt": $isDebt,\n'
          '"value": $value,\n'
          '"description": $description,\n'
          '"user": $userId\n'
       '}';
  }
}