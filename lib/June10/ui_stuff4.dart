import 'package:flutter/material.dart';
import '../widgets.dart';
import '../data/data.dart';

class Stuff4 extends StatefulWidget {
  @override
  _Stuff4State createState() => _Stuff4State();
}

class _Stuff4State extends State<Stuff4> {

  CustomTextFieldController _sickLeaves = CustomTextFieldController();
  CustomTextFieldController _paidLeaves = CustomTextFieldController();
  CustomTextFieldController _casualLeaves = CustomTextFieldController();


  bool _validate() {
    return _sickLeaves.isValid &&
        _paidLeaves.isValid &&
        _casualLeaves.isValid ;


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
                          title: "Sick Leaves",
                          controller: _sickLeaves,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "Paid Leaves",
                          controller: _paidLeaves,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Casual Leaves",
                          controller: _casualLeaves,
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
                    title: "Confirm",
                    isExpanded: true,
                    margin: EdgeInsets.only(left: 8, bottom: 24, right:24, top: 44),
                    onTap: (){
                      if(_validate()){
                        print('${_sickLeaves.text}\n${_paidLeaves.text}\n${_casualLeaves.text}');
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
