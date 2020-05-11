import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class ResidentDetails extends StatefulWidget {
  @override
  _ResidentDetailsState createState() => _ResidentDetailsState();
}

class _ResidentDetailsState extends State<ResidentDetails> {
  CustomTextFieldController _firstName = CustomTextFieldController();
  CustomTextFieldController _middleName = CustomTextFieldController();
  CustomTextFieldController _lastName = CustomTextFieldController();
  CustomTextFieldController _emailAddress = CustomTextFieldController();
  CustomTextFieldController _contactNumber = CustomTextFieldController();
  CustomTextFieldController _contactNumberToPublish = CustomTextFieldController();
  CustomTextFieldController _photoUpload = CustomTextFieldController();
  CustomTextFieldController _registeredAs= CustomTextFieldController();
  CustomTextFieldController _publishedContact = CustomTextFieldController();

  CustomTextFieldController _complex = CustomTextFieldController();

  CustomTextFieldController _unit = CustomTextFieldController();
  CustomTextFieldController _startDate = CustomTextFieldController();
  CustomTextFieldController _endDate = CustomTextFieldController();



  bool _validate() {
    return _firstName.isValid &&
        _lastName.isValid &&
        _emailAddress.isValid &&
        _contactNumber.isValid &&
        _contactNumberToPublish.isValid &&
        _middleName.isValid &&
        _photoUpload.isValid &&
        _complex.isValid &&
        _registeredAs.isValid &&
        _publishedContact.isValid &&
        _unit.isValid &&
        _startDate.isValid &&
        _endDate.isValid ;

  }
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Resident',
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
                    InAppTitle(title: 'Resident Details',),
                    Column(
                      children: <Widget>[
                        CustomTextField(
                          title: "First Name",
                          controller: _firstName,
                          validate: Validate.withOption(
                            isRequired: false,

                          ),
                        ),
                        CustomTextField(
                          title: "Middle Name",
                          controller: _middleName,
                          validate: Validate.withOption(
                            isRequired: false,

                          ),
                        ),
                        CustomTextField(
                          title: "Last Name",
                          controller: _lastName,
                          validate: Validate.withOption(
                            isRequired: false,

                          ),
                        ),
                        CustomTextField(
                          title: "Email address",
                          controller: _emailAddress,
                          validate: Validate.withOption(
                              isRequired: false,
                              isEmail: true

                          ),
                        ),
                        CustomTextField(
                          title: "Contact Number",
                          controller: _contactNumber,
                          validate: Validate.withOption(
                              isRequired: false,
                              isNumber: true

                          ),
                        ),
                        CustomTextField(
                          title: "Contact Number To Publish",
                          controller: _contactNumber,
                          validate: Validate.withOption(
                              isRequired: false,
                              isNumber: true

                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Registered as",
                          controller: _registeredAs,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Published Contact",
                          controller: _publishedContact,
                          validate: Validate.withOption(
                            isRequired: false,

                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "select Complex",
                          controller: _complex,
                          loadData:() async => ["Goa5reydf","Mumbai5re","Dhakat5r"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Select Unit",
                          controller: _unit,
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
                            isRequired: false,

                          ),
                        ),
                        CustomTextField(
                          title: "End Date",
                          controller: _endDate,
                          validate: Validate.withOption(
                            isRequired: false,

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
                        print('${_firstName.text}\n${_middleName.text}\n${_lastName.text}\n${_emailAddress.text}\n${_contactNumber.text}\n${_registeredAs.text}\n${_publishedContact.text}\n${_complex.text}\n${_endDate.text}\n${_unit.text}\n${_startDate.text}');
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
