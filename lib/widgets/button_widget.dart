import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String? text;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final Color color;
  final double borderRadius;
  final TextStyle? textStyle;
  final Widget? child;
  const CustomFilledButton.text(
      {super.key,
      this.height = 50,
      this.width = double.infinity,
      required this.text,
      this.onPressed,
      required this.color,
      this.borderRadius = 18,
      this.textStyle})
      : child = null;

  const CustomFilledButton.widget(
      {super.key,
      this.height = 50,
      this.width = double.infinity,
      required this.child,
      this.onPressed,
      required this.color,
      this.borderRadius = 18,
      this.textStyle})
      : text = null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Material(
          color: color,
          child: InkWell(
            radius: borderRadius,
            onTap: onPressed,
            child: Center(
              child: text != null
                  ? Text(
                      text!,
                      style: textStyle,
                    )
                  : child,
            ),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button.text(
      {super.key,
      this.circularRadius = 0,
      required this.text,
      this.height,
      this.width,
      this.fontSize,
      this.fontWeight,
      this.backgroundColor,
      this.onTap,
      this.textColor})
      : child = null;

  const Button.widget(
      {super.key,
      this.circularRadius = 0,
      required this.child,
      this.height,
      this.width,
      this.fontSize,
      this.fontWeight,
      this.backgroundColor,
      this.onTap,
      this.textColor})
      : text = null;

  final double circularRadius;
  final double? height;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? text;
  final Widget? child;
  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(circularRadius)),
        child: Material(
          color: backgroundColor,
          child: InkWell(
              onTap: onTap,
              child: Center(
                child: text != null
                    ? Text(
                        text!,
                        style: TextStyle(
                            fontWeight: fontWeight,
                            fontSize: fontSize,
                            color: textColor),
                      )
                    : child,
              )),
        ),
      ),
    );
  }
}
