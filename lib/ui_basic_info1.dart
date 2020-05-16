import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class Basic1 extends StatefulWidget {
  @override
  _Basic1State createState() => _Basic1State();
}

class _Basic1State extends State<Basic1> {
  CustomTextFieldController _dateOfJoining = CustomTextFieldController();
  CustomTextFieldController _studentName = CustomTextFieldController();
  CustomTextFieldController _dateOfBirth = CustomTextFieldController();
  CustomTextFieldController _uploadPhoto = CustomTextFieldController();
  CustomTextFieldController _selectGender = CustomTextFieldController();
  CustomTextFieldController _idCardNumber = CustomTextFieldController();





  bool _validate() {
    return _dateOfJoining.isValid &&
        _studentName.isValid &&
        _dateOfBirth.isValid &&
        _uploadPhoto.isValid &&
        _idCardNumber.isValid &&
        _selectGender.isValid;


  }
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: '24 c, 7th Street',
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
                    InAppTitle(title: 'Basic Info',),
                    Column(
                      children: <Widget>[


                        CustomTextField(
                          title: "Date Of Joing",
                          controller: _dateOfJoining,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Student Name",
                          controller: _studentName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Select Date Of Birth",
                          controller: _dateOfBirth,
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
                        CustomTextField(
                          title: "Select Gender",
                          controller: _selectGender,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Enter ID Card Number",
                          controller: _idCardNumber,
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
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomActionButton(
                    title: "Cancel",
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
                    title: "Save",
                    isExpanded: true,
                    margin: EdgeInsets.only(left: 8, bottom: 24, right:24, top: 44),
                    onTap: (){
                      if(_validate()){
                        print('${_dateOfJoining.text}\n${_studentName.text}\n${_dateOfBirth.text}\n${_uploadPhoto.text}\n${_selectGender.text}\n${_idCardNumber.text}');
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
