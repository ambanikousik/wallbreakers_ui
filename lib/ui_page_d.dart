import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class UipageD extends StatefulWidget {
  @override
  _UipageDState createState() => _UipageDState();
}

class _UipageDState extends State<UipageD> {
  CustomTextFieldController _g1Name = CustomTextFieldController();
  CustomTextFieldController _g1PhoneNumber = CustomTextFieldController();
  CustomTextFieldController _g1EmailAddress = CustomTextFieldController();
  CustomTextFieldController _g1AppUserId = CustomTextFieldController();
  CustomTextFieldController _g2Name = CustomTextFieldController();
  CustomTextFieldController _g2PhoneNumber= CustomTextFieldController();
  CustomTextFieldController _g2EmailAddress = CustomTextFieldController();
  CustomTextFieldController _g2AppUserId = CustomTextFieldController();
  bool _regular = true;

  bool _validate() {
    return _g1Name.isValid &&
        _g1PhoneNumber.isValid &&
        _g1EmailAddress.isValid &&
        _g1AppUserId.isValid &&
        _g2Name.isValid &&
        _g2PhoneNumber.isValid &&
         _g2EmailAddress.isValid &&
        _g2AppUserId.isValid ;
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
                          title: "G1 Name",
                          controller: _g1Name,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "G1 Phone Number",
                          controller: _g1PhoneNumber,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "G1 Email Address",
                          controller: _g1EmailAddress,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "G1 App User Id",
                          controller: _g1AppUserId,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "G2 Name",
                          controller: _g2Name,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "G2 Phone Number",
                          controller: _g2PhoneNumber,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "G2 Email Address",
                          controller: _g2EmailAddress,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "G2 User AppID",
                          controller: _g2AppUserId,
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
                        print('${_g1Name.text}\n${_g1PhoneNumber.text}\n${_g1EmailAddress.text}\n${_g1AppUserId.text}\n${_g2Name.text}\n${_g2PhoneNumber.text}\n${_g2EmailAddress.text}\n${_g2AppUserId.text}\n$_regular');
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
