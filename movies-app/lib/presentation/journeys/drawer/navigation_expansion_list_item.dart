import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/languages.dart';
import 'package:movies_app/domain/entities/Language.dart';
import 'package:movies_app/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';

class NavigationExpansionListItem extends StatelessWidget {
  final String title;
  //final void Function() handlePress;
  final List<String> childsList;
  const NavigationExpansionListItem({
    super.key,
    required this.title,
    //required this.handlePress,
    required this.childsList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 2,
          ),
        ],
      ),
      child: ExpansionTile(
        iconColor: Appcolors.royalBlue,
        collapsedIconColor: Appcolors.royalBlue,
        initiallyExpanded: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        children: [
          for (int i = 0; i < childsList.length; i++)
            NavigationListItem(
              title: childsList[i],
              handlePress: () {
                context.read<LanguageBloc>().add(ChangePrefferedLanguageEvent(
                    language: Languages.languages[i]));
              },
              isSubItem: true,
            )
        ],
      ),
    );
  }
}
