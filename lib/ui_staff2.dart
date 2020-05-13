import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';

class Staff2 extends StatefulWidget {
  @override
  _Staff2State createState() => _Staff2State();
}

class _Staff2State extends State<Staff2> {
  CustomTextFieldController _dateOfBirth = CustomTextFieldController();
  CustomTextFieldController _startDate = CustomTextFieldController();
  CustomTextFieldController _endDate = CustomTextFieldController();
  CustomTextFieldController _uploadPhoto = CustomTextFieldController();
  CustomTextFieldController _selectRole = CustomTextFieldController();
  CustomTextFieldController _timeInterval = CustomTextFieldController();
  bool _locationUpdateRequirement = true;
  bool _showAsTeamMember = true;
  bool _suspendIssue = true;


  bool _validate() {
    return _dateOfBirth.isValid &&
        _startDate.isValid &&
        _endDate.isValid &&
        _uploadPhoto.isValid &&
        _selectRole.isValid &&
        _timeInterval.isValid ;


  }
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Garden Square',
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    InAppTitle(title: 'Staff',),
                    Column(
                      children: <Widget>[


                        CustomTextField(
                          title: "Date Of Birth",
                          controller: _dateOfBirth,
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
                          title: "Upload Photo",
                          controller: _uploadPhoto,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                         title: "Select Role",
                        controller: _selectRole,
                         loadData:() async => ["A","B","C"],
                        displayName:(x)=> x,
                         validate: Validate.withOption(
                         isRequired: true,
                            ),
                       ),
                        CustomTextField(
                          title: "Time Interval",
                          controller: _timeInterval,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomSwitch(
                          title: "Location Update Required?",
                          isEnabled: _locationUpdateRequirement,
                          onChange: (x){ _locationUpdateRequirement = x;},
                        ),
                        CustomSwitch(
                          title: "Show as a Team Member",
                          isEnabled: _showAsTeamMember,
                          onChange: (x){ _showAsTeamMember = x;},
                        ),
                        CustomSwitch(
                          title: "Suspand Issue",
                          isEnabled: _suspendIssue,
                          onChange: (x){ _suspendIssue = x;},
                        ),










                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomActionButton(
                    title: "Save",
                    isExpanded: true,
                    isOutline: true,
                    margin: EdgeInsets.only(left: 24, bottom: 24, right: 8, top: 44),
                    onTap: (){
                      print("Do nothign");
                    },
                  ),
                ),
                Expanded(
                  child: CustomActionButton(
                    title: "Next",
                    isExpanded: true,
                    margin: EdgeInsets.only(left: 8, bottom: 24, right:24, top: 44),
                    onTap: (){
                      if(_validate()){
                        print('${_dateOfBirth.text}\n${_startDate.text}\n${_endDate.text}\n${_uploadPhoto.text}\n${_selectRole.text}\n${_timeInterval.text}\n$_locationUpdateRequirement\n$_showAsTeamMember\n$_suspendIssue');
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
