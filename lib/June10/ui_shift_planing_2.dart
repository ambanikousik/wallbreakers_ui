import 'package:flutter/material.dart';
import '../widgets.dart';
import '../data/data.dart';


class ShiftPlaning2 extends StatefulWidget {
  @override
  _ShiftPlaning2State createState() => _ShiftPlaning2State();
}

class _ShiftPlaning2State extends State<ShiftPlaning2> {


  CustomTextFieldController _monthOfYear = CustomTextFieldController();
  bool _oneTime = true;
  bool _recurring = false;

  bool _validate() {
    return _monthOfYear.isValid ;

  }



  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Garden Square',
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    InAppTitle(title: 'Shift Planing',),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 6),
                      child: Column(
                        children: <Widget>[



                          CustomSwitch(
                            title: "One Time",
                            isEnabled: _oneTime,
                            onChange: (x){ _oneTime = x;},
                          ),
                          CustomSwitch(
                            title: "Recurring",
                            isEnabled: _recurring,
                            onChange: (x){ _recurring = x;},
                          ),
                          CustomDropDownList<String>(
                            title: "Select Month/Year",
                            controller: _monthOfYear,
                            loadData:() async => ["January","February","March","April","May","June","July","August","September","Octaber","November","December"],
                            displayName:(x)=> x,
                            validate: Validate.withOption(
                              isRequired: true,
                            ),
                          ),

                        ],
                      ),
                    ),
                    //CustomDatePicker(days: days,),
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
                        print('${_monthOfYear.text}\n$_oneTime\n$_recurring');
                      }
                      print('selected days: ');
                     // days.forEach((day) { if(day.isSelected){print('${day.day}'); }});
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
