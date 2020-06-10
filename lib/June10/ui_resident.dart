import 'package:flutter/material.dart';
import 'package:wallbreakersui/widgets.dart';
import 'package:wallbreakersui/data/data.dart';
class Resident extends StatefulWidget {
  @override
  _ResidentState createState() => _ResidentState();
}

class _ResidentState extends State<Resident> {
  CustomTextFieldController _registerAs = CustomTextFieldController();
  CustomTextFieldController _publishedContact = CustomTextFieldController();
  CustomTextFieldController _startDate = CustomTextFieldController();
  CustomTextFieldController _endDate = CustomTextFieldController();
  CustomTextFieldController _managementPosition = CustomTextFieldController();

  bool _recieveMessage = true;


  bool _validate() {
    return _registerAs.isValid &&
        _publishedContact.isValid &&
        _startDate.isValid &&
        _endDate.isValid &&
        _managementPosition.isValid ;



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
                          title: "Registered As",
                          controller: _registerAs,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Published Contact",
                          controller: _publishedContact,
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
                        CustomTextField(
                          title: "End Date",
                          controller: _endDate,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Management Position",
                          controller: _managementPosition,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),



                        CustomSwitch(
                          title: "Recieve Message",
                          isEnabled: _recieveMessage,
                          onChange: (x){ _recieveMessage = x;},
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
