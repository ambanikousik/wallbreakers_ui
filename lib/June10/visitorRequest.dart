import 'package:flutter/material.dart';
import 'package:wallbreakersui/widgets.dart';
import 'package:wallbreakersui/data/data.dart';

class VisitorRequest extends StatefulWidget {
  @override
  _VisitorRequestState createState() => _VisitorRequestState();
}

class _VisitorRequestState extends State<VisitorRequest> {
  CustomTextFieldController _name = CustomTextFieldController();
  CustomTextFieldController _phoneNumber = CustomTextFieldController();
  CustomTextFieldController _numberOfGuests = CustomTextFieldController();
  CustomTextFieldController _startDate = CustomTextFieldController();

  bool _entryNotification= true;



  bool _validate() {
    return _name.isValid &&
        _phoneNumber.isValid &&
        _numberOfGuests.isValid &&
        _startDate.isValid ;



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
                          title: "Number Of Guests",
                          controller: _numberOfGuests,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Start Date",
                          controller: _startDate,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),



                        CustomSwitch(
                          title: "Entry Notification",
                          isEnabled: _entryNotification,
                          onChange: (x){ _entryNotification = x;},
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
