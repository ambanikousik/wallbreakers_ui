import 'package:wallbreakersui/data/data.dart';
import 'package:flutter/material.dart';

class InAppTitle extends StatelessWidget {

  final String title;
  final String subtitle;

  InAppTitle({this.title,this.subtitle,})
      :assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: height*4,),
          Text(title,style: inAppTitle,),
          subtitle != null?
          Text(subtitle,style: inAppSubTitle,):
              SizedBox(height: height*1,)
        ],
      ),
    );
  }
}
