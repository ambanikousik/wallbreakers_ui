import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class AcademicInfo extends StatefulWidget {
  @override
  _AcademicInfoState createState() => _AcademicInfoState();
}

class _AcademicInfoState extends State<AcademicInfo> {
  CustomTextFieldController _nameOfInstitution = CustomTextFieldController();
  CustomTextFieldController _classAttended = CustomTextFieldController();
  CustomTextFieldController _academicPercentage = CustomTextFieldController();
  CustomTextFieldController _majorDegree = CustomTextFieldController();






  bool _validate() {
    return _nameOfInstitution.isValid &&
        _classAttended.isValid &&
        _academicPercentage.isValid &&
        _majorDegree.isValid ;



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
                    InAppTitle(title: 'Academic Info',),
                    Column(
                      children: <Widget>[


                        CustomTextField(
                          title: "Name of institution",
                          controller: _nameOfInstitution,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Class Attended",
                          controller: _classAttended,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Academic Percentage",
                          controller: _academicPercentage,
                          validate: Validate.withOption(
                            isRequired: true,

                          ),
                        ),

                        CustomTextField(
                          title: "Major Degree",
                          controller: _majorDegree,
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
                        print('${_nameOfInstitution.text}\n${_classAttended.text}\n${_academicPercentage.text}\n${_majorDegree.text}');
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
