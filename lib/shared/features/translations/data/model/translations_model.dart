// To parse this JSON data, do
//
//     final translationsModel = translationsModelFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/translation_entity.dart';

TranslationsModel translationsModelFromJson(String str) =>
    TranslationsModel.fromJson(json.decode(str));

String translationsModelToJson(TranslationsModel data) =>
    json.encode(data.toJson());

class TranslationsModel {
  final Map<String, String>? message;

  TranslationsModel({this.message});

  factory TranslationsModel.fromJson(Map<String, dynamic> json) =>
      TranslationsModel(
        message: Map.from(
          json["message"]!,
        ).map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
    "message": Map.from(
      message!,
    ).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };

  TranslationEntity toEntity() => TranslationEntity(data: message);
}
