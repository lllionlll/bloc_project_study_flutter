import 'package:hive/hive.dart';
import 'package:movies_app/common/constants/database_constants.dart';

abstract class LanguageLocalDataSource {
  Future<void> savePreferredLanguage(String languageCode);
  Future<String> getPreferredLanguage();
}

class LanguageLocalDataSourceImpl extends LanguageLocalDataSource {
  @override
  Future<String> getPreferredLanguage() async {
    final languageBox = await Hive.openBox(DatabaseConstatns.languageBox);
    return languageBox.get(DatabaseConstatns.preferredLanguageCode,
        defaultValue: DatabaseConstatns.preferredLanguageCodeDefaultValue);
  }

  @override
  Future<void> savePreferredLanguage(String languageCode) async {
    final languageBox = await Hive.openBox(DatabaseConstatns.languageBox);
    await languageBox.put(
        DatabaseConstatns.preferredLanguageCode, languageCode);
  }
}
