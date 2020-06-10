import 'package:flutter/material.dart';
import '../widgets.dart';
import '../data/data.dart';
class Stuff extends StatefulWidget {
  @override
  _StuffState createState() => _StuffState();
}

class _StuffState extends State<Stuff> {
  CustomTextFieldController _firstName = CustomTextFieldController();
  CustomTextFieldController _emailAddress = CustomTextFieldController();
  CustomTextFieldController _contactNumber = CustomTextFieldController();
  CustomTextFieldController _address = CustomTextFieldController();
  CustomTextFieldController _lastName = CustomTextFieldController();
  CustomTextFieldController _middlename = CustomTextFieldController();


  bool _validate() {
    return _firstName.isValid &&
        _emailAddress.isValid &&
        _contactNumber.isValid &&
        _address.isValid &&
        _lastName.isValid &&
        _middlename.isValid ;


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
                          title: "First Name",
                          controller: _firstName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Last Name",
                          controller: _lastName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "Middle Name",
                          controller: _middlename,
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












                      ],
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
