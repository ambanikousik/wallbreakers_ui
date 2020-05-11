import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';

class Complex extends StatefulWidget {
  @override
  _ComplexState createState() => _ComplexState();
}

class _ComplexState extends State<Complex> {

  CustomTextFieldController _complexName = CustomTextFieldController();
  CustomTextFieldController _address = CustomTextFieldController();
  CustomTextFieldController _town = CustomTextFieldController();
  CustomTextFieldController _state = CustomTextFieldController();


  bool _validate() {
    return _complexName.isValid &&
        _address.isValid &&
        _town.isValid &&
        _state.isValid ;

  }
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Complex Manager',
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
                    InAppTitle(title: 'Complex Details',),
                    Column(
                      children: <Widget>[
                        CustomTextField(
                          title: "Complex Name",
                          controller: _complexName,
                          validate: Validate.withOption(
                            isRequired: true,
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
                          title: "Town",
                          controller: _town,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "State",
                          controller: _state,
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
                        print('${_complexName.text}\n${_address.text}\n${_town.text}\n${_state.text}');
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
