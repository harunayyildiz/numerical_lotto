import 'package:flutter/material.dart';

class ComponentsButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final Color splashColor;
  final double radius;
  final double height;
  final Widget buttonRightIcon;
  final Widget buttonLeftIcon;
  final double buttonFontSize;
  final VoidCallback onPressed;
  ComponentsButton(
      {Key key,
      @required this.buttonText,
      @required this.buttonColor,
      this.splashColor,
      this.textColor,
      this.radius,
      this.height,
      this.buttonRightIcon,
      this.buttonLeftIcon,
      this.onPressed,
      this.buttonFontSize: 18})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 9.0,
            spreadRadius: -1.0,
            offset: Offset(
              -1.0,
              3.0,
            ),
          )
        ],
        borderRadius: new BorderRadius.circular(radius ?? 16),
      ),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 11.5),
        splashColor: splashColor,
        highlightColor: buttonColor,
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(radius ?? 10.0),
          side: BorderSide(
            color: buttonColor,
          ),
        ),
        highlightElevation: 0,
        child: Row(
          //Max Alana Yay
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 25), child: buttonLeftIcon),
            Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: buttonFontSize,
                  color: textColor),
            ),
            Padding(
                padding: EdgeInsets.only(right: 25), child: buttonRightIcon),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}

//
// if (buttonRightIcon != null) ...[
//               Padding(
//                   padding: EdgeInsets.only(right: 25), child: buttonRightIcon),
//             ]
