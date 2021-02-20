import 'package:flutter/material.dart';
import 'package:numerical_lotto/constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  final Widget widgetLeft;
  final Widget widgetRight;
  CustomAppBar({@required this.title, this.widgetLeft, this.widgetRight});
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                widgetLeft ??
                    Opacity(opacity: 0, child: Icon(Icons.help_outline)),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    title,
                    style: textTextStyleVogue20,
                  ),
                ),
                widgetRight ??
                    Opacity(opacity: 0, child: Icon(Icons.help_outline)),
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(80));
  }

  @override
  Widget get child => throw UnimplementedError();
  @override
  Size get preferredSize => Size(80, 80);
}
