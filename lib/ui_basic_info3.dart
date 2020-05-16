import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class Basic3 extends StatefulWidget {
  @override
  _Basic3State createState() => _Basic3State();
}

class _Basic3State extends State<Basic3> {
  CustomTextFieldController _phoneNumber = CustomTextFieldController();
  CustomTextFieldController _email = CustomTextFieldController();
  CustomTextFieldController _allocateTransportRoute = CustomTextFieldController();
  CustomTextFieldController _appUserId = CustomTextFieldController();
  CustomTextFieldController _activeSession = CustomTextFieldController();






  bool _validate() {
    return _phoneNumber.isValid &&
        _email.isValid &&
        _allocateTransportRoute.isValid &&
        _appUserId.isValid &&
        _activeSession.isValid;


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
                          title: "Phone Number",
                          controller: _phoneNumber,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Email",
                          controller: _email,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Active Session",
                          controller: _activeSession,
                          loadData:() async => ["Morning","Afternoon","Evening"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "Enter App User ID",
                          controller: _appUserId,
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
                        print('${_phoneNumber.text}\n${_email.text}\n${_allocateTransportRoute.text}\n${_activeSession.text}\n${_appUserId.text}');
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
