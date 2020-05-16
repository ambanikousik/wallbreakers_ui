import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';

class ClassPeriod extends StatefulWidget {
  @override
  _ClassPeriodState createState() => _ClassPeriodState();
}

class _ClassPeriodState extends State<ClassPeriod> {
  CustomTextFieldController _classPeriodName = CustomTextFieldController();
  CustomTextFieldController _selectStartTime = CustomTextFieldController();
  CustomTextFieldController _selectEndingTime = CustomTextFieldController();




  bool _validate() {
    return _classPeriodName.isValid &&
        _selectStartTime.isValid &&
        _selectEndingTime.isValid ;


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
                    InAppTitle(title: 'Class Period',),
                    Column(
                      children: <Widget>[


                        CustomTextField(
                          title: "Class Period Name",
                          controller: _classPeriodName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Select start time",
                          controller: _selectStartTime,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Select end time",
                          controller: _selectEndingTime,
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
                        print('${_selectEndingTime.text}\n${_selectStartTime.text}\n${_classPeriodName.text}');
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
