import 'package:flutter/material.dart';

import '../constantes.dart';
import '../size_config.dart';

class RadioGender<T> extends StatelessWidget {
  const RadioGender({
    super.key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.title,
    required this.imagePath,
    this.fillColor=kPrimaryColor,
    required this.radioValue,
    this.radioGroupValue,
    this.onChanged,
  });

  final double width;
  final double height;
  final Color backgroundColor;
  final String title;
  final String imagePath;
  final Color? fillColor;
  final T radioValue;
  final T? radioGroupValue;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged?.call(radioValue),
      child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            double parentWidth = constraints.maxWidth;
            return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Transform.scale(
                  scale: parentWidth / 100,
                  child: Radio(
                    value: radioValue,
                    groupValue: radioGroupValue,
                    onChanged: onChanged,
                    fillColor: MaterialStateProperty.all(fillColor),
                  )),
              Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: parentWidth * 0.12,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width: parentWidth - 40,
                      height: parentWidth - 40,
                      child: Image.asset(
                        imagePath,
                      )),
                ],
              ),
            ]);
          })),
    );
  }
}
