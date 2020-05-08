
import 'package:wallbreakersui/data/data.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final String title;
  final bool isEnabled;
  final ValueChanged<bool> onChange;
  final EdgeInsetsGeometry margin;

  const CustomSwitch({Key key,@required this.title, this.isEnabled=false, this.onChange, this.margin}) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _enabled=false;

  @override
  void initState() {
    super.initState();
    _enabled = widget.isEnabled;
  }

  _onChange(bool x){
    if(mounted)setState(() {
      _enabled = x;
    });
    widget.onChange?.call(_enabled);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.margin??EdgeInsets.only(left: 24, right: 12, top: 20,),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              widget.title,
              style: TextStyle(
                color: C.primaryTextGray,
                fontSize: 18,
              ),
            ),
          ),
          Switch(value: _enabled, onChanged:_onChange),
        ],
      ),
    );
  }
}
