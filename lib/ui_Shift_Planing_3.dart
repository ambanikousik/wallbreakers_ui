import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class ShiftPlaning3 extends StatefulWidget {
  @override
  _ShiftPlaning3State createState() => _ShiftPlaning3State();
}

class _ShiftPlaning3State extends State<ShiftPlaning3> {
  CustomTextFieldController _employee = CustomTextFieldController();
  CustomTextFieldController _role = CustomTextFieldController();



  bool _validate() {
    return _employee.isValid &&
        _role.isValid ;


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
                    InAppTitle(title: 'Shift Planning',),
                    Column(
                      children: <Widget>[

                        CustomDropDownList<String>(
                          title: "Select Employee",
                          controller: _employee,
                          loadData:() async => ["General","Other"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Role",
                          controller: _role,
                          loadData:() async => ["Manager","Labour"],
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
                      if(_validate()){
                        print('${_employee.text}\n${_role.text}');
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
