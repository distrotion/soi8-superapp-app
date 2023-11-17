import 'package:flutter/material.dart';

class Com_Text extends StatelessWidget {
  Com_Text(
      {Key? key,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.str,
      this.isUnderLine,
      this.overflow,
      this.fontStyle,
      this.letterSpacing,
      this.textAlign})
      : super(key: key);
  String? str;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  bool? isUnderLine;
  TextOverflow? overflow;
  TextAlign? textAlign;
  FontStyle? fontStyle;
  double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      str ?? "",
      style: TextStyle(
        fontStyle: fontStyle,
        fontFamily: 'SukhumvitSet',
        letterSpacing: letterSpacing,
        fontSize: fontSize ?? 18,
        fontWeight: fontWeight ?? FontWeight.w700,
        color: color ?? const Color(0xff000000),
        overflow: TextOverflow.ellipsis,
        decoration: isUnderLine ?? false
            ? TextDecoration.underline
            : TextDecoration.none,
      ),
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
