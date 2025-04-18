import 'package:json_annotation/json_annotation.dart';
import '../../dashboard.dart';
part 'studio_model.g.dart';

@JsonSerializable()
class StudioModel extends Studio {
  const StudioModel({
    required super.objectId,
    required super.cnpj,
    required super.name,
    required super.phone,
    required super.email,
    required super.cep,
    required super.address,
    required super.number,
    required super.neighborhood,
    required super.city,
    required super.state,
    required super.complement,
    required super.country,
  });

  factory StudioModel.fromJson(Map<String, dynamic> json) =>
      _$StudioModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudioModelToJson(this);

  factory StudioModel.fromEntity(Studio studio) {
    return StudioModel(
      objectId: studio.objectId,
      cnpj: studio.cnpj,
      name: studio.name,
      phone: studio.phone,
      email: studio.email,
      cep: studio.cep,
      address: studio.address,
      number: studio.number,
      neighborhood: studio.neighborhood,
      city: studio.city,
      state: studio.state,
      complement: studio.complement,
      country: studio.country,
    );
  }
}
