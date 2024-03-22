// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudioModel _$StudioModelFromJson(Map<String, dynamic> json) => StudioModel(
      objectId: json['objectId'] as String?,
      cnpj: json['cnpj'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      cep: json['cep'] as String?,
      address: json['address'] as String?,
      number: json['number'] as String?,
      neighborhood: json['neighborhood'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      complement: json['complement'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$StudioModelToJson(StudioModel instance) =>
    <String, dynamic>{
      'objectId': instance.objectId,
      'cnpj': instance.cnpj,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'cep': instance.cep,
      'address': instance.address,
      'number': instance.number,
      'neighborhood': instance.neighborhood,
      'city': instance.city,
      'state': instance.state,
      'complement': instance.complement,
      'country': instance.country,
    };
