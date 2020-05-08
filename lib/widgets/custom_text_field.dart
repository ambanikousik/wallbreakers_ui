import 'package:flutter/material.dart';
import 'package:wallbreakersui/data/data.dart';

class CustomTextField extends StatefulWidget {
  final CustomTextFieldController controller;
  final Function(String text) onChange;
  final String title;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry margin;
  final Validate validate;
  final IconData icon;
  final bool enabled;
  final bool isMultiLine;

  const CustomTextField(
      {Key key,
      @required this.controller,
      this.onChange,
      @required this.title,
      this.keyboardType = TextInputType.text,
      this.margin,
      this.validate,
      this.icon,
      this.enabled = true,
      this.isMultiLine = false})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  Color _dividerColor;
  String _errorText = "";

  @override
  void initState() {
    super.initState();
//    _focusNode.addListener((){if(mounted)setState(() {});});
    widget.controller._init(_getTextHandler, _setTextHandler, _clearTextHandler,
        _isValidHandler, _setErrorText);
  }

  String _getTextHandler() {
    return widget.controller._textEditingController.text;
  }

  _setTextHandler(String txt) {
    widget.controller._textEditingController.text = txt;
    _isValidHandler();
  }

  _setErrorText(String value) {
    _setErrorTextColor(value);
  }

  bool _isValidHandler() {
    if (widget.validate != null) {
      var data = widget.validate._validate(
          widget.controller._textEditingController.text, widget.title);
      if (data == null || data.isEmpty) {
        // valid data
        _setErrorTextColor("");
        return true;
      } else {
        //invalid data
        _setErrorTextColor(data);
        return false;
      }
    } else
      return true;
  }

  _clearTextHandler() {
    widget.controller._textEditingController.clear();
  }

  void _setErrorTextColor(String x) {
    if (mounted)
      setState(() {
        _errorText = x;
        _dividerColor = _errorText == null || _errorText.isEmpty
            ? C.elevationShadowColor
            : C.primaryTextRed; // _focusNode.hasFocus? C.primaryBlue:
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ??
          EdgeInsets.only(
            top: 24,
          ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: TextField(
                      focusNode: _focusNode,
                      controller: widget.controller._textEditingController,
                      keyboardType: widget.keyboardType,
                      enabled: widget.enabled,
                      autofocus: false,
                      maxLines: widget.isMultiLine ? null : 1,
                      style: TextStyle(
                        fontSize: 18,
                        color: C.primaryTextBlack,
                      ),
                      decoration: InputDecoration(
                        labelText: widget.title,
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                          height: 0.5,
                          fontSize: 18,
                          color: C.primaryTextGray,
                        ),
                        contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                      ),
                      onChanged: (x) {
                        widget.onChange?.call(x);
                        _isValidHandler();
                      },
                    ),
                  ),
                ),
                widget.icon != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 6),
                        child: SizedBox(
                          child: Icon(
                            widget.icon,
                            size: 14,
                            color: Colors.grey.withOpacity(.7),
                          ),
                          height: 16,
                          width: 16,
                        ),
                      )
                    : Offstage(),
              ],
            ),
            Divider(
              color: _dividerColor,
              thickness: 1,
            ),
            _errorText.isNotEmpty
                ? Text(
                    _errorText,
                    style: TextStyle(
                      color: C.primaryTextRed,
                      fontSize: 11,
                    ),
                  )
                : Offstage(),
          ],
        ),
      ),
    );
  }
}

class CustomTextFieldController {
  final TextEditingController _textEditingController = TextEditingController();
  var tag;
  String Function() _getTextHandler;
  bool Function() _isValidHandler;
  void Function() _clearTextHandler;
  void Function(String value) _setTextHandler;
  void Function(String value) _setErrorText;
  _init(
      String Function() getTextHandler,
      Function(String value) setTextHandler,
      Function() clearTextHandler,
      bool Function() isValidHandler,
      Function(String value) setErrorText) {
    _getTextHandler = getTextHandler;
    _setTextHandler = setTextHandler;
    _isValidHandler = isValidHandler;
    _clearTextHandler = clearTextHandler;
    _setErrorText = setErrorText;
  }

  String get text => _getTextHandler?.call();
  set text(String value) => _setTextHandler?.call(value);
  set errorText(String value) => _setErrorText?.call(value);
  bool get isValid => _isValidHandler?.call();
  void clear() {
    _clearTextHandler?.call();
  }
}

class Validate {
  bool isRequired;
  int minLength;
  int maxLength;
  bool isEmail;
  bool isNumber;

  Validate.withOption(
      {this.isRequired,
      this.isEmail = false,
      this.minLength,
      this.maxLength = 50,
      this.isNumber = false});

  String _validate(String value, String fieldName) {
    String _field =
        "${fieldName[0].toUpperCase()}${fieldName.substring(1).toLowerCase()}";
    if (isRequired != null && isRequired && (value == null || value.isEmpty)) {
      return "$_field is required!";
    }
    if (minLength != null && (value == null || value.length < minLength)) {
      return "Minimum $minLength characters required!";
    }
    if (maxLength != null && (value == null || value.length > maxLength)) {
      return "Maximum $maxLength characters allowed!";
    }
    if (isEmail && (value == null || !RegExp(_emailPattern).hasMatch(value))) {
      return "Invalid email address!";
    }
    if (isNumber && (value == null || double.tryParse(value) == null)) {
      return "Not a valid number!";
    }
    return "";
  }
}

final String _emailPattern =
    r"^[-!#$%&'*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&'*+/0-9=?A-Z^_a-z{|}~])*@[a-zA-Z](-?[a-zA-Z0-9])*(\.[a-zA-Z](-?[a-zA-Z0-9])*)+$";
