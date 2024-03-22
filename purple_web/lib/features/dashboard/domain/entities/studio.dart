import 'package:equatable/equatable.dart';

class Studio extends Equatable {
  final String? objectId;
  final String cnpj;
  final String name;
  final String phone;
  final String email;
  final String? cep;
  final String? address;
  final String? number;
  final String? neighborhood;
  final String? city;
  final String? state;
  final String? complement;
  final String? country;

  const Studio({
    this.objectId,
    required this.cnpj,
    required this.name,
    required this.phone,
    required this.email,
    this.cep,
    this.address,
    this.number,
    this.neighborhood,
    this.city,
    this.state,
    this.complement,
    this.country,
  });

  @override
  List<Object?> get props => [
        objectId,
        cnpj,
        name,
        phone,
        email,
        cep,
        address,
        number,
        neighborhood,
        city,
        state,
        complement,
        country,
      ];
}
