import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';


class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  CustomTextFieldController _firstName = CustomTextFieldController();
  CustomTextFieldController _middleName = CustomTextFieldController();
  CustomTextFieldController _lastName = CustomTextFieldController();
  CustomTextFieldController _email = CustomTextFieldController();
  CustomTextFieldController _contactNumber = CustomTextFieldController();
  CustomTextFieldController _password = CustomTextFieldController();
  CustomTextFieldController _passwordM = CustomTextFieldController();


  bool _validate() {
    return _firstName.isValid &&
        _middleName.isValid &&
        _lastName.isValid &&
        _email.isValid &&
        _contactNumber.isValid &&
        _password.isValid &&
        _passwordM.isValid ;
  }




  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'SignUp',
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
                          title: "Middle Name",
                          controller: _middleName,
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
                          title: "Contact Number",
                          controller: _contactNumber,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Password",
                          controller: _password,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Confirm Password",
                          controller: _passwordM,
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
                    title: "SignUp",
                    isExpanded: true,
                    margin: EdgeInsets.only(left: 8, bottom: 24, right:24, top: 44),
                    onTap: (){
                      if(_validate()){
                        print('${_firstName.text}\n${_middleName.text}\n${_lastName.text}\n${_contactNumber.text}\n${_password.text}\n${_email.text}\n${_passwordM.text}');
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
