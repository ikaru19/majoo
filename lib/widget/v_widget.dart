import 'package:flutter/material.dart';
import 'package:majoo_test/utils/v_color.dart';
import 'package:majoo_test/utils/v_font_size.dart';

Widget vLeadingButton(
    {@required title,
    height = 44.0,
    @required onTap,
    @required leading,
    color = Colors.grey,
    textColor = Colors.white}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: height,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          leading,
          SizedBox(width: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 43),
              child: VText(
                title,
                color: textColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class VText extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final TextAlign align;
  final bool bold;
  final TextDecoration decoration;
  final int maxLines;

  VText(this.title,
      {this.color,
      this.fontSize,
      this.fontWeight,
      this.overflow,
      this.align,
      this.bold = false,
      this.decoration,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: bold ? "poppinsBold" : "poppinsRegular",
        color: color ?? Colors.white,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
      overflow: overflow ?? TextOverflow.fade,
      textAlign: align ?? TextAlign.left,
      maxLines: maxLines,
    );
  }
}

class VButton extends StatelessWidget {
  final String title;
  final Color colorBoxDecoration;
  final double paddingSymmetric;
  final Color colorTitle;
  final bool bold;
  final double fontSize;
  final FontWeight fontWeight;
  final double paddingHorizontal;
  final double circularRadius;
  final bool isDiscountPrice;
  final String normalPrice;

  VButton(
      {this.title,
        this.colorBoxDecoration,
        this.paddingSymmetric,
        this.paddingHorizontal,
        this.colorTitle,
        this.bold,
        this.fontSize,
        this.fontWeight,
        this.circularRadius,
        this.isDiscountPrice = false,
        this.normalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: paddingSymmetric ?? 13, horizontal: paddingHorizontal ?? 0),
      decoration: BoxDecoration(
        color: colorBoxDecoration ?? Colors.white,
        borderRadius: BorderRadius.circular(circularRadius ?? 100),
      ),
      child: !isDiscountPrice
          ? Center(
          child: VText(title,
              bold: bold ?? false,
              fontSize: fontSize ?? VFontSize.body,
              fontWeight: fontWeight ?? FontWeight.bold,
              align: TextAlign.center,
              color: colorTitle ?? VColor.red_dark))
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VText(normalPrice,
              fontSize: VFontSize.caption,
              decoration: TextDecoration.lineThrough),
          SizedBox(
            width: 5,
          ),
          VText(title,
              bold: true,
              fontSize: fontSize ?? VFontSize.body,
              fontWeight: fontWeight ?? FontWeight.bold)
        ],
      ),
    );
  }
}
