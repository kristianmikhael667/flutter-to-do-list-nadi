import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:nasari_flutter/constants/color_palette.dart';
import 'package:nasari_flutter/constants/text_styles.dart';

final currencyFormat = NumberFormat.currency(locale: 'ID');
final currencyFormatter = NumberFormat('#,##0', 'ID');

void printConsole(dynamic text) {
  if (kDebugMode) {
    print(text);
  }
}

snackbarWidget(String title, String message, Duration duration) {
  Get.showSnackbar(GetSnackBar(
    backgroundColor: ColorPalette.primary,
    titleText: Text(
      title,
      style: FontTextStyle.whiteTextStyle
          .copyWith(fontWeight: FontWeightEnum.bold),
    ),
    messageText: Text(
      message,
      style: FontTextStyle.whiteTextStyle
          .copyWith(fontWeight: FontWeightEnum.regular),
    ),
    duration: duration,
  ));
}
