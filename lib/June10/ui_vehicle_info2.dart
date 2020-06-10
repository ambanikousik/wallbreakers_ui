import 'package:flutter/material.dart';
import 'package:wallbreakersui/widgets.dart';
import 'package:wallbreakersui/data/data.dart';
class VehicleInfo2 extends StatefulWidget {
  @override
  _VehicleInfo2State createState() => _VehicleInfo2State();
}

class _VehicleInfo2State extends State<VehicleInfo2> {
  CustomTextFieldController _visitorName = CustomTextFieldController();
  CustomTextFieldController _visitorPhoneNumber = CustomTextFieldController();

  bool _isActive = true;
  bool _isVisitor = true;
  bool _pickAndDrop = true;


  bool _validate() {
    return _visitorName.isValid &&
        _visitorPhoneNumber.isValid ;



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

                        CustomSwitch(
                          title: "Is Active",
                          isEnabled: _isActive,
                          onChange: (x){ _isActive = x;},
                        ),
                        CustomSwitch(
                          title: "Is Visitor",
                          isEnabled: _isVisitor,
                          onChange: (x){ _isVisitor = x;},
                        ),
                        CustomTextField(
                          title: "Visitor Name",
                          controller: _visitorName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Visitor Phone Number",
                          controller: _visitorPhoneNumber,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),



                        CustomSwitch(
                          title: "Pick and Drop",
                          isEnabled: _pickAndDrop,
                          onChange: (x){ _pickAndDrop = x;},
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
