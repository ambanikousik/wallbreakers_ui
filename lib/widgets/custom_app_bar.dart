import 'package:flutter/material.dart';
import 'package:wallbreakersui/data/data.dart';
//import 'package:wallbreakersui/';


class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback action;
  final String title;

  CustomAppBar({Key key,
    this.action,
    @required this.title})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        assert(title !=null),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.action != null ? IconButton(
        icon: Icon(Icons.subdirectory_arrow_left),
        iconSize: width * 8,
        onPressed: widget.action,) : null,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      backgroundColor: white,
      title:  Center(child: Text(widget.title, style: appbarText,)),);
  }
}