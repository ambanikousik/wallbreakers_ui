import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class Stuff extends StatefulWidget {
  @override
  _StuffState createState() => _StuffState();
}

class _StuffState extends State<Stuff> {
  CustomTextFieldController _name = CustomTextFieldController();
  CustomTextFieldController _emailAddress = CustomTextFieldController();
  CustomTextFieldController _contactNumber = CustomTextFieldController();
  CustomTextFieldController _address = CustomTextFieldController();
  CustomTextFieldController _serviceOffered = CustomTextFieldController();
  CustomTextFieldController _selectService = CustomTextFieldController();


  bool _validate() {
    return _name.isValid &&
        _emailAddress.isValid &&
        _contactNumber.isValid &&
        _address.isValid &&
        _serviceOffered.isValid &&
        _selectService.isValid ;


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
                          title: "Name",
                          controller: _name,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Email Address",
                          controller: _emailAddress,
                          validate: Validate.withOption(
                            isRequired: true,
                            isEmail: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Contact Number",
                          controller: _contactNumber,
                          validate: Validate.withOption(
                            isRequired: true,
                            isNumber: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Address",
                          controller: _address,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Service Offered",
                          controller: _serviceOffered,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Select Service",
                          controller: _selectService,
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
                        print('${_name.text}\n${_emailAddress.text}\n${_contactNumber.text}\n${_address.text}\n${_serviceOffered.text}\n${_selectService.text}');
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
