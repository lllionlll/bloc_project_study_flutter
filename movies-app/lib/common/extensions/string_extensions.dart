import 'package:flutter/cupertino.dart';
import 'package:movies_app/presentation/app_localizations.dart';

extension StringExtension on String {
  String get intelTrim {
    return this.length > 15 ? '${this.substring(0, 15)}...' : this;
  }

  String translate(BuildContext context) {
    return AppLocalizations.of(context).translate(this);
  }
}
