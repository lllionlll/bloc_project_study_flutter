import 'package:movies_app/common/constants/languange_constants.dart';
import 'package:movies_app/presentation/journeys/home/movies_tabs/tab.dart';

class TabConstants {
  TabConstants._();
  static const List<Tab> movieTabs = [
    Tab(index: 0, title: LanguageConstansts.popular),
    Tab(index: 1, title: LanguageConstansts.now),
    Tab(index: 2, title: LanguageConstansts.soon),
  ];
}
