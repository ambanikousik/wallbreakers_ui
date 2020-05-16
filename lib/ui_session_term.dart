import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';

class SessionTerm extends StatefulWidget {
  @override
  _SessionTermState createState() => _SessionTermState();
}

class _SessionTermState extends State<SessionTerm> {
  CustomTextFieldController _sessionTermName = CustomTextFieldController();
  CustomTextFieldController _selectStartDate = CustomTextFieldController();
  CustomTextFieldController _selectEndingDate = CustomTextFieldController();

  bool _isActive = true;


  bool _validate() {
    return _sessionTermName.isValid &&
        _selectStartDate.isValid &&
        _selectEndingDate.isValid ;


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
                    InAppTitle(title: 'Session Term',),
                    Column(
                      children: <Widget>[


                        CustomTextField(
                          title: "Session Term Name",
                          controller: _sessionTermName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Start start date",
                          controller: _selectStartDate,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Select ending date",
                          controller: _selectEndingDate,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomSwitch(
                          title: "Is Active?",
                          isEnabled: _isActive,
                          onChange: (x){ _isActive = x;},
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
                        print('${_selectEndingDate.text}\n${_selectStartDate.text}\n${_sessionTermName.text}\n$_isActive');
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
