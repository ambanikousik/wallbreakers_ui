import 'package:flutter/material.dart';
import 'package:wallbreakersui/data/data.dart';

class CustomActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isExpanded;
  final bool isOutline;
  final EdgeInsetsGeometry margin;

  CustomActionButton(
      {this.title,
      this.onTap,
      this.isExpanded = false,
      this.isOutline = false,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: isExpanded ? double.infinity : null,
          margin:
              margin ?? EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
          decoration: BoxDecoration(
            color: isOutline ? white : buttonColorBlue,
            borderRadius: BorderRadius.circular(100),
            border:
                Border.all(color: isOutline ? buttonColorBlue : white, width: 1),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isOutline ? buttonColorBlue :white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
