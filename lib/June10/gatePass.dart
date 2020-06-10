import 'package:flutter/material.dart';
import 'package:wallbreakersui/widgets.dart';
import 'package:wallbreakersui/data/data.dart';
class GatePass extends StatefulWidget {
  @override
  _GatePassState createState() => _GatePassState();
}

class _GatePassState extends State<GatePass> {
  CustomTextFieldController _serviceProviderId = CustomTextFieldController();
  CustomTextFieldController _memberId = CustomTextFieldController();
  CustomTextFieldController _name = CustomTextFieldController();
  CustomTextFieldController _date  = CustomTextFieldController();
  CustomTextFieldController _time = CustomTextFieldController();
  CustomTextFieldController _notes = CustomTextFieldController();

  bool _validate() {
    return _serviceProviderId.isValid &&
        _memberId.isValid &&
        _name.isValid &&
        _date.isValid &&
        _time.isValid &&
        _notes.isValid ;


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
                          title: "Service Provider ID",
                          controller: _serviceProviderId,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),


                        CustomTextField(
                          title: "Member Id",
                          controller: _memberId,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Name",
                          controller: _name,
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
                          title: "Time",
                          controller: _time,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Notes",
                          controller: _time,
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
