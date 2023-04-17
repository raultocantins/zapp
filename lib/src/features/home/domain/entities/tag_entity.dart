import 'package:zapp/src/features/home/domain/entities/tags_entity.dart';
import 'package:zapp/src/features/home/presenter/controllers/home_controller.dart';

class TagEntity {
  final String label;
  TagEntity(this.label);
}

class Tags {
  List<TagEntity> ptTags = [
    TagEntity("Tecnologia"),
    TagEntity("Política"),
    TagEntity("Esportes"),
    TagEntity("Entretenimento"),
    TagEntity("Economia"),
    TagEntity("Saúde"),
    TagEntity("Meio ambiente"),
    TagEntity("Guerra"),
  ];
  List<TagEntity> enTags = [
    TagEntity("technology"),
    TagEntity("Policy"),
    TagEntity("sports"),
    TagEntity("Entertainment"),
    TagEntity("Economy"),
    TagEntity("Health"),
    TagEntity("Environment"),
    TagEntity("War"),
  ];

  TagsEntity getTags(LanguagesEnum? language) {
    switch (language) {
      case LanguagesEnum.PT:
        return TagsEntity(ptTags);
      case LanguagesEnum.EN:
        return TagsEntity(enTags);

      default:
        return TagsEntity(ptTags);
    }
  }
}
