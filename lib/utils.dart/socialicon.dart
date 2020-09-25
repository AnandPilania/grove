import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocalIcon({
    Key key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          shape: BoxShape.circle,
        ),
        child: iconSrc == 'assets/images/linked.jpeg'
            ? Image.asset(iconSrc, height: 27, width: 27)
            : SvgPicture.asset(
                iconSrc,
                height: 27,
                width: 27,
              ),
      ),
    );
  }
}
