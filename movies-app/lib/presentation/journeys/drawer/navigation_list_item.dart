import 'package:flutter/material.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';

class NavigationListItem extends StatelessWidget {
  final String title;
  final void Function() handlePress;
  final bool isSubItem;
  const NavigationListItem({
    Key? key,
    required this.title,
    required this.handlePress,
    this.isSubItem = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handlePress,
      child: Container(
        padding: isSubItem ? const EdgeInsets.only(left: 20) : null,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.7),
                blurRadius: 2),
          ],
        ),
        child: ListTile(
          title: Text(
            title.translate(context),
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
