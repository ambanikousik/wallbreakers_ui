import 'package:flutter/material.dart';
import 'package:wallbreakersui/widgets.dart';
import 'package:wallbreakersui/data/data.dart';

class AddAssignments extends StatefulWidget {
  @override
  _AddAssignmentsState createState() => _AddAssignmentsState();
}

class _AddAssignmentsState extends State<AddAssignments> {
  CustomTextFieldController _virtualRoom = CustomTextFieldController();
  CustomTextFieldController _offering = CustomTextFieldController();
  CustomTextFieldController _topic = CustomTextFieldController();
  CustomTextFieldController _assignment = CustomTextFieldController();
  CustomTextFieldController _showSolution = CustomTextFieldController();
  CustomTextFieldController _startDate = CustomTextFieldController();
  CustomTextFieldController _endDate = CustomTextFieldController();
  CustomTextFieldController _type = CustomTextFieldController();





  bool _validate() {
    return _virtualRoom.isValid &&
        _offering.isValid &&
        _assignment.isValid &&
        _topic.isValid &&
        _showSolution.isValid &&
        _startDate.isValid &&
        _endDate.isValid &&

        _type.isValid ;



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
                          title: "Virtual Room",
                          controller: _virtualRoom,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Offering",
                          controller: _offering,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Topic",
                          controller: _topic,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Assignment",
                          controller: _assignment,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Type",
                          controller: _type,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Show Solution",
                          controller: _showSolution,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
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
