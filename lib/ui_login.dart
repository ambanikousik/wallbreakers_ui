import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  CustomTextFieldController _email = CustomTextFieldController();
  CustomTextFieldController _password = CustomTextFieldController();

  bool _validate() {
    return _email.isValid &&
        _password.isValid ;

  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(

                  children: <Widget>[
                    Container(
                       height: height*40,
                        width: width*40,
                        child: Image.asset('assets/logo.png',)),
                    Text('BRINDAVAN',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.blue),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text('Email', style: TextStyle(fontSize: 21,color: Colors.blue)),
                        CustomTextField(
                          title: "Example@mail.com",
                          controller: _email,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        Text('Password', style: TextStyle(fontSize: 21,color: Colors.blue),),
                        CustomTextField(
                          title: "*************",
                          controller: _password,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),






                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('Forget Password?',style: TextStyle(color: Colors.grey,fontSize: 15),),
                      ],
                    ),
                    Container(
                      child: CustomActionButton(
                        title: "LOGIN",
                        isExpanded: true,
                        margin: EdgeInsets.only(left: 8, bottom: 24, right:24, top: 44),
                        onTap: (){
                          if(_validate()){
                            print('${_email.text}\n${_password.text}');
                          }
                        },
                      ),
                    ),
                  ],
                ),

              ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account? ", style: TextStyle(fontSize: 15.5),),
                GestureDetector(
                    onTap: (){

                    },
                    child: Text("Sign Up ", style: TextStyle(fontSize: 15.5, decoration: TextDecoration.underline),))

              ],
            ),

          ],
        ),
      ),
    );
  }
}
