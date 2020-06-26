import 'package:flutter/material.dart';
import 'package:wallbreakersui/widgets.dart';
import 'package:wallbreakersui/data/data.dart';

class OfferingSchedule extends StatefulWidget {
  @override
  _OfferingScheduleState createState() => _OfferingScheduleState();
}

class _OfferingScheduleState extends State<OfferingSchedule> {
  CustomTextFieldController _offeringName = CustomTextFieldController();
  CustomTextFieldController _primaryMemberId = CustomTextFieldController();
  CustomTextFieldController _periodType = CustomTextFieldController();
  CustomTextFieldController _classPeriodName = CustomTextFieldController();
  CustomTextFieldController _roomName = CustomTextFieldController();
  CustomTextFieldController _virtualRoomName = CustomTextFieldController();
  CustomTextFieldController _sessionTermName = CustomTextFieldController();





  bool _validate() {
    return _offeringName.isValid &&
        _primaryMemberId.isValid &&
        _periodType.isValid &&
        _classPeriodName.isValid &&
        _roomName.isValid &&
        _virtualRoomName.isValid &&
        _sessionTermName.isValid ;



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
                          title: "Offering Name",
                          controller: _offeringName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Primary Member ID",
                          controller: _primaryMemberId,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Period Type",
                          controller: _periodType,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Class Period Name",
                          controller: _classPeriodName,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Room Name",
                          controller: _roomName,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Virtual Room Name",
                          controller: _virtualRoomName,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Session Term Name",
                          controller: _sessionTermName,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
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
