import 'package:flutter/material.dart';
import 'package:nasari_flutter/constants/color_palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasari_flutter/constants/text_styles.dart';

class LoadingDialog extends StatelessWidget {
  final bool isLoading;
  final String text;
  const LoadingDialog({super.key, required this.isLoading, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isLoading)
          const Opacity(
            opacity: 0.6,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (isLoading)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(
                  color: ColorPalette.primary,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(text,
                    style: FontTextStyle.whiteTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: FontWeightEnum.regular))
              ],
            ),
          )
      ],
    );
  }
}
