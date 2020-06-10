import 'package:flutter/material.dart';
import 'package:wallbreakersui/widgets.dart';
import 'package:wallbreakersui/data/data.dart';

class AdHocVisitor extends StatefulWidget {
  @override
  _AdHocVisitorState createState() => _AdHocVisitorState();
}

class _AdHocVisitorState extends State<AdHocVisitor> {

  CustomTextFieldController _name = CustomTextFieldController();
  CustomTextFieldController _phoneNumber= CustomTextFieldController();
  CustomTextFieldController _date = CustomTextFieldController();
  CustomTextFieldController _unitNumber  = CustomTextFieldController();
  CustomTextFieldController _purposeOfVisiting = CustomTextFieldController();


  bool _validate() {
    return _name.isValid &&
        _unitNumber.isValid &&
        _phoneNumber.isValid &&
        _date.isValid &&
        _purposeOfVisiting.isValid;

  }
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    Column(
                      children: <Widget>[


                        CustomTextField(
                          title: "Name",
                          controller: _name,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),


                        CustomTextField(
                          title: "Phone Number",
                          controller: _phoneNumber,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Date",
                          controller: _date,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Enter Unit Number",
                          controller: _unitNumber,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Purpose of Visiting",
                          controller: _purposeOfVisiting,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),











                      ],
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
