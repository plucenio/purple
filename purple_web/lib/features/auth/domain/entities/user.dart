import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String username;
  final String? email;
  final String? password;

  const User({
    this.id,
    required this.username,
    required this.password,
    this.email,
  });

  @override
  List<Object?> get props => [
        id,
        username,
        password,
        email,
      ];
}
