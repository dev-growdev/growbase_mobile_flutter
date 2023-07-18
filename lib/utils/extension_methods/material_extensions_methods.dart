import 'package:flutter/material.dart';

import '../../themes/app_colors.theme_extension.dart';

extension TextStyleExtension on TextStyle? {
  TextStyle? boldWeight() => this?.copyWith(fontWeight: FontWeight.bold);
  TextStyle? mediumWeight() => this?.copyWith(fontWeight: FontWeight.w500);

  TextStyle? withPrimaryColor(BuildContext context) => this?.copyWith(
        color: context.appColors.primary,
      );
  TextStyle? withErrorColor(BuildContext context) => this?.copyWith(
        color: context.appColors.red,
      );

  TextStyle? withDefaultColor(BuildContext context) => this?.copyWith(
        color: context.appColors.darkGrey,
      );
}

extension ContextExtension on BuildContext {
  Size get sizeOf => MediaQuery.sizeOf(this);
  EdgeInsets get padding => MediaQuery.viewPaddingOf(this);
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
