import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class Guardian extends StatefulWidget {
  @override
  _GuardianState createState() => _GuardianState();
}

class _GuardianState extends State<Guardian> {
  CustomTextFieldController _guardianRelation = CustomTextFieldController();
  CustomTextFieldController _guardianName = CustomTextFieldController();
  CustomTextFieldController _guardianEmailAddress = CustomTextFieldController();
  CustomTextFieldController _guardianPhoneNumber = CustomTextFieldController();
  CustomTextFieldController _guardianId = CustomTextFieldController();





  bool _validate() {
    return _guardianRelation.isValid &&
        _guardianName.isValid &&
        _guardianEmailAddress.isValid &&
        _guardianPhoneNumber.isValid &&
        _guardianId.isValid;


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
                    InAppTitle(title: 'Guardian',),
                    Column(
                      children: <Widget>[


                        CustomTextField(
                          title: "Guardian Relation",
                          controller: _guardianRelation,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Guardian Name",
                          controller: _guardianName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Guardian email address",
                          controller: _guardianEmailAddress,
                          validate: Validate.withOption(
                            isRequired: true,
                            isEmail: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Guardian phone number",
                          controller: _guardianPhoneNumber,
                          validate: Validate.withOption(
                            isRequired: true,
                            isNumber: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Guardian ID",
                          controller: _guardianId,
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
                        print('${_guardianRelation.text}\n${_guardianName.text}\n${_guardianEmailAddress.text}\n${_guardianPhoneNumber.text}\n${_guardianId.text}');
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
