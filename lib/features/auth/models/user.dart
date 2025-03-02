class User {
  final String uuid;
  final String email;
  final String password;
  final String username;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final DateTime? lockedTime;

  User({
    required this.uuid,
    required this.email,
    required this.password,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    this.lockedTime,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json['uuid'],
      email: json['email'],
      password: json['password'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      lockedTime: json['lockedTime'] != null
          ? DateTime.parse(json['lockedTime'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'email': email,
      'password': password,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'lockedTime': lockedTime?.toIso8601String(),
    };
  }
}
