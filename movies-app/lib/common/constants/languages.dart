import 'package:movies_app/common/constants/languange_constants.dart';
import 'package:movies_app/domain/entities/Language.dart';

class Languages {
  Languages._();
  static List<Language> languages = [
    Language(code: 'en', value: LanguageConstansts.english),
    Language(code: 'ar', value: LanguageConstansts.arabic),
  ];
}
