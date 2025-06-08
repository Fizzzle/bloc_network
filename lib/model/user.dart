class User {
  final int id;
  final String name;
  final String? email;
  final String? number;

  User({required this.id, required this.name, required this.email, required this.number});

  factory User.fromJson(Map<String, dynamic> user) {
    return User(id: user['id'], name: user['name'] ?? 'no name', email: user['email'] ?? 'no email', number: user['number'] ?? 'no number');
  }
}