import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String username;
  final String email;
  final String password;
  final String confirmedPassword;
  final String phone;

  const User({
    required this.name,
    required this.username,
    required this.password,
    required this.confirmedPassword,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        name,
        username,
        password,
        confirmedPassword,
        email,
        phone,
      ];
}
