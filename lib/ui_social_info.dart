import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class SocialInfo extends StatefulWidget {
  @override
  _SocialInfoState createState() => _SocialInfoState();
}

class _SocialInfoState extends State<SocialInfo> {
  CustomTextFieldController _casteName = CustomTextFieldController();
  CustomTextFieldController _bplStudent = CustomTextFieldController();
  CustomTextFieldController _motherTongue = CustomTextFieldController();
  CustomTextFieldController _religion = CustomTextFieldController();
  CustomTextFieldController _offeringsTaken = CustomTextFieldController();
  CustomTextFieldController _additionalInfo = CustomTextFieldController();





  bool _validate() {
    return _casteName.isValid &&
        _bplStudent.isValid &&
        _motherTongue.isValid &&
        _religion.isValid &&
        _offeringsTaken.isValid &&
        _additionalInfo.isValid;


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
                    InAppTitle(title: 'Social Info',),
                    Column(
                      children: <Widget>[


                        CustomTextField(
                          title: "Caste Name",
                          controller: _casteName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Bpl Student",
                          controller: _bplStudent,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Selet mother tongue",
                          controller: _motherTongue,
                          validate: Validate.withOption(
                            isRequired: true,

                          ),
                        ),
                        CustomTextField(
                          title: "Select Religion",
                          controller: _religion,
                          validate: Validate.withOption(
                            isRequired: true,

                          ),
                        ),
                        CustomTextField(
                          title: "Select Offerings Taken",
                          controller: _offeringsTaken,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Enter additional info",
                          controller: _additionalInfo,
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
                        print('${_casteName.text}\n${_bplStudent.text}\n${_motherTongue.text}\n${_religion.text}\n${_offeringsTaken.text}\n${_additionalInfo.text}');
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
