import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasari_flutter/constants/text_styles.dart';

class CustomFormField extends StatelessWidget {
  final String? title;
  final bool obsecureText;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final Color? borderColor;
  final Color? underlineColor;
  final Color? cursorColor;
  final Color? fillColor;
  final EdgeInsetsGeometry? padding;
  final bool lastField;
  final TextStyle? textStyle;
  final TextStyle? textFieldStyle;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints? prefixConstraints;
  final List<TextInputFormatter>? inputFormatter;
  final int radius;
  final String? hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final AutovalidateMode autoValidateMode;
  final Function()? onEditingCompleted;
  final FocusNode? focusNode;
  final TextStyle? errorStyle;
  final bool readOnly;
  const CustomFormField({
    super.key,
    this.title,
    this.obsecureText = false,
    this.controller,
    this.prefix,
    this.textInputType,
    this.borderColor,
    this.padding = const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    this.lastField = false,
    this.textStyle,
    this.fillColor,
    this.textFieldStyle,
    this.suffixIcon,
    this.underlineColor,
    this.cursorColor,
    this.contentPadding = const EdgeInsets.all(15),
    this.prefixIcon,
    this.prefixConstraints,
    this.inputFormatter,
    this.radius = 8,
    this.hintText,
    this.onChanged,
    this.validator,
    this.onEditingCompleted,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.focusNode,
    this.errorStyle,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Text(
                  title!,
                  style: textStyle,
                )
              : Container(),
          title != null ? SizedBox(height: 6.h) : Container(),
          TextFormField(
            readOnly: readOnly,
            autovalidateMode: autoValidateMode,

            focusNode: focusNode,
            controller: controller,
            obscureText: obsecureText,
            onEditingComplete: onEditingCompleted,
            textInputAction:
                lastField ? TextInputAction.done : TextInputAction.next,
            style: textFieldStyle,
            // maxLength: title == 'Nomor Telephone' ? 14 : null,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeightEnum.regular),
              fillColor: fillColor, filled: fillColor != null ? true : false,
              border: borderColor != null
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius.r),
                      borderSide: BorderSide(color: borderColor!))
                  : title == 'No Handphone'
                      ? UnderlineInputBorder(
                          borderSide: BorderSide(color: underlineColor!))
                      : null,
              focusedBorder: borderColor != null
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius.r),
                      borderSide: BorderSide(color: borderColor!))
                  : title == 'No Handphone'
                      ? UnderlineInputBorder(
                          borderSide: BorderSide(color: underlineColor!))
                      : null,
              enabledBorder: borderColor != null
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius.r),
                      borderSide: BorderSide(color: borderColor!))
                  : title == 'No Handphone'
                      ? UnderlineInputBorder(
                          borderSide: BorderSide(color: underlineColor!))
                      : null,
              errorStyle: errorStyle,
              // disabledBorder: borderColor != null
              //     ? OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(radius.r),
              //         borderSide: BorderSide(color: borderColor!))
              //     : null,
              prefix: title == 'Nomor Telephone' || title == 'No Handphone'
                  ? prefix
                  : null,
              prefixIcon: prefixIcon,
              prefixIconConstraints: prefixConstraints,
              contentPadding: contentPadding,
              suffixIcon: suffixIcon,
            ),
            onChanged: onChanged,
            cursorColor: cursorColor ?? Colors.grey,
            keyboardType: textInputType,
            inputFormatters: inputFormatter,
          ),
        ],
      ),
    );
  }
}

class CustomFormFieldWithoutTitle extends StatelessWidget {
  final String? title;
  final bool obsecureText;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final Color? borderColor;
  final Color? underlineColor;
  final Color? cursorColor;
  final Color? fillColor;
  final EdgeInsetsGeometry? padding;
  final bool lastField;
  final TextStyle? textStyle;
  final TextStyle? textFieldStyle;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints? prefixConstraints;
  final List<TextInputFormatter>? inputFormatter;
  final int radius;
  final String? hintText;
  final Function()? onTap;
  final bool readOnly;
  final Function()? onEditingCompleted;
  final FocusNode? focusNode;
  final bool autoFocus;
  const CustomFormFieldWithoutTitle({
    super.key,
    this.title,
    this.obsecureText = false,
    this.controller,
    this.prefix,
    this.textInputType,
    this.borderColor,
    this.padding = const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    this.lastField = false,
    this.textStyle,
    this.fillColor,
    this.textFieldStyle,
    this.suffixIcon,
    this.underlineColor,
    this.cursorColor,
    this.contentPadding = const EdgeInsets.all(15),
    this.prefixIcon,
    this.prefixConstraints,
    this.inputFormatter,
    this.radius = 8,
    this.hintText,
    this.onTap,
    this.readOnly = false,
    this.onEditingCompleted,
    this.focusNode,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: padding!,
        child: TextFormField(
          focusNode: focusNode,
          controller: controller,
          obscureText: obsecureText,
          readOnly: readOnly,
          onTap: onTap,
          autofocus: autoFocus,
          onEditingComplete: onEditingCompleted,
          textInputAction:
              lastField ? TextInputAction.done : TextInputAction.next,
          style: textFieldStyle,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: fillColor, filled: fillColor != null ? true : false,
            border: borderColor != null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius.r),
                    borderSide: BorderSide(color: borderColor!))
                : title == 'No Handphone'
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(color: underlineColor!))
                    : null,
            focusedBorder: borderColor != null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius.r),
                    borderSide: BorderSide(color: borderColor!))
                : title == 'No Handphone'
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(color: underlineColor!))
                    : null,
            enabledBorder: borderColor != null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius.r),
                    borderSide: BorderSide(color: borderColor!))
                : title == 'No Handphone'
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(color: underlineColor!))
                    : null,
            // disabledBorder: borderColor != null
            //     ? OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(radius.r),
            //         borderSide: BorderSide(color: borderColor!))
            //     : null,
            prefix: title == 'Nomor Telephone' || title == 'No Handphone'
                ? prefix
                : null,
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixConstraints,
            contentPadding: contentPadding,
            suffixIcon: suffixIcon,
          ),
          cursorColor: cursorColor ?? Colors.grey,
          keyboardType: textInputType,
          inputFormatters: inputFormatter,
        ),
      ),
    );
  }
}
