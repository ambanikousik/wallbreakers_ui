import 'package:flutter/material.dart';
import '../widgets.dart';
import '../data/data.dart';
import '../model/models.dart';

class UiPageA extends StatefulWidget {
  @override
  _UiPageAState createState() => _UiPageAState();
}

class _UiPageAState extends State<UiPageA> {


  List<Day> days = [
    Day(day: 'S',isSelected: false),
    Day(day: 'M',isSelected: false),
    Day(day: 'T',isSelected: false),
    Day(day: 'W',isSelected: false),
    Day(day: 'T',isSelected: false),
    Day(day: 'F',isSelected: false),
    Day(day: 'S',isSelected: false),
  ];



  CustomTextFieldController _name = CustomTextFieldController();
  CustomTextFieldController _address = CustomTextFieldController();
  CustomTextFieldController _occupation = CustomTextFieldController();
  CustomTextFieldController _age = CustomTextFieldController();
  bool _regular = true;

  bool _validate() {
    return _name.isValid &&
        _name.isValid &&
        _occupation.isValid &&
        _age.isValid &&
        _address.isValid;
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Service Provider',
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    InAppTitle(title: 'Information',),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 6),
                      child: Column(
                        children: <Widget>[
                          CustomTextField(
                            title: "Name",
                            controller: _name,
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
                          CustomDropDownList<String>(
                            title: "Occupation",
                            controller: _occupation,
                            loadData:() async => ["Student","Teacher","Staff"],
                            displayName:(x)=> x,
                            validate: Validate.withOption(
                              isRequired: true,
                            ),
                          ),
                          CustomTextField(
                            title: "Age",
                            controller: _age,
                            validate: Validate.withOption(
                              isRequired: true,
                              isNumber: true
                            ),
                          ),
                          CustomSwitch(
                            title: "Is Active",
                            isEnabled: _regular,
                            onChange: (x){ _regular = x;},
                          ),

                        ],
                      ),
                    ),
                    CustomDatePicker(days: days,),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomActionButton(
                    title: "Back",
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
                        print('${_name.text}\n${_address.text}\n${_occupation.text}\n${_age.text}\n$_regular');
                      }
                      print('selected days: ');
                      days.forEach((day) { if(day.isSelected){print('${day.day}'); }});
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
