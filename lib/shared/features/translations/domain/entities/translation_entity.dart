class TranslationEntity {
  final Map<String, String>? data;

  TranslationEntity({required this.data});

  factory TranslationEntity.initial() =>
      TranslationEntity(data: {});
}
