import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class UiPageC extends StatefulWidget {
  @override
  _UiPageCState createState() => _UiPageCState();
}

class _UiPageCState extends State<UiPageC> {
  CustomTextFieldController _serviceProviderId = CustomTextFieldController();
  CustomTextFieldController _userType = CustomTextFieldController();
  CustomTextFieldController _route = CustomTextFieldController();
  CustomTextFieldController _userID = CustomTextFieldController();
  CustomTextFieldController _username = CustomTextFieldController();
  CustomTextFieldController _userPhoneNumber= CustomTextFieldController();
  CustomTextFieldController _userEmailAddress = CustomTextFieldController();
  CustomTextFieldController _appUserID = CustomTextFieldController();
  bool _regular = true;

  bool _validate() {
    return _serviceProviderId.isValid &&
        _userType.isValid &&
        _route.isValid &&
        _userID.isValid &&
        _username.isValid &&
        _userPhoneNumber.isValid &&
        _userEmailAddress.isValid &&
        _appUserID.isValid;
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Service Provider',
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
                    InAppTitle(title: 'Route Trip Registration',),
                    Column(
                      children: <Widget>[
                        CustomTextField(
                          title: "Service Provider Id",
                          controller: _serviceProviderId,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "User Type",
                          controller: _userType,
                          loadData:() async => ["Stuff","Tenant","manager"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Route",
                          controller: _route,
                          loadData:() async => ["DAC-ZYL","GOA-MANALI","DUB-DAC"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "User ID",
                          controller: _userID,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "User Name",
                          controller: _username,
                          validate: Validate.withOption(
                              isRequired: true,
                              isNumber: true
                          ),
                        ),
                        CustomTextField(
                          title: "User Phone Number",
                          controller: _userPhoneNumber,
                          validate: Validate.withOption(
                              isRequired: true,
                              isNumber: true
                          ),
                        ),
                        CustomTextField(
                          title: "User Email Address",
                          controller: _userEmailAddress,
                          validate: Validate.withOption(
                              isRequired: true,
                              isNumber: true
                          ),
                        ),
                        CustomTextField(
                          title: "App User ID",
                          controller: _appUserID,
                          validate: Validate.withOption(
                              isRequired: true,
                              isNumber: true
                          ),
                        ),
                        CustomSwitch(
                          title: "Is Active",
                          isEnabled: _regular,
                          onChange: (x){ _regular = x;},
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
                    title: "Back",
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
                        print('${_appUserID.text}\n${_userEmailAddress.text}\n${_userPhoneNumber.text}\n${_username.text}\n${_userID.text}\n${_route.text}\n${_userType.text}\n${_serviceProviderId.text}\n$_regular');
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
