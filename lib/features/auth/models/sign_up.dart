class SignUp {
  final String email;
  final String password;
  final String username;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;

  SignUp({
    required this.email,
    required this.password,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
  });

  factory SignUp.fromJson(Map<String, dynamic> json) {
    return SignUp(
      email: json['email'],
      password: json['password'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth.toIso8601String(),
    };
  }
}
