import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/languange_constants.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/presentation/widgets/button_widget.dart';

class AppErrorWidget extends StatelessWidget {
  final ErrorType errorType;
  final void Function() handleRetryPress;
  const AppErrorWidget({
    Key? key,
    required this.errorType,
    required this.handleRetryPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //TODO: add check for database errorType
        Text(
          errorType == ErrorType.api
              ? LanguageConstansts.someThingWentWrongError.translate(context)
              : LanguageConstansts.checkNetworkError.translate(context),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 20),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              text: LanguageConstansts.retry,
              handlePress: handleRetryPress,
            ),
            ButtonWidget(
              text: LanguageConstansts.feedback,
              //TODO: handle feedback
              handlePress: () {},
            ),
          ],
        ),
      ],
    );
  }
}
