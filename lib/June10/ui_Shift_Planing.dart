import 'package:flutter/material.dart';
import '../widgets.dart';
import '../data/data.dart';
class ShiftPlaning extends StatefulWidget {
  @override
  _ShiftPlaningState createState() => _ShiftPlaningState();
}

class _ShiftPlaningState extends State<ShiftPlaning> {
  CustomTextFieldController _shiftType = CustomTextFieldController();
  CustomTextFieldController _shiftName = CustomTextFieldController();
  CustomTextFieldController _startTime = CustomTextFieldController();
  CustomTextFieldController _endTime = CustomTextFieldController();


  bool _validate() {
    return _startTime.isValid &&
        _shiftName.isValid &&
        _shiftType.isValid &&
        _endTime.isValid ;

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
                    InAppTitle(title: 'Shift Planing',),
                    Column(
                      children: <Widget>[

                        CustomDropDownList<String>(
                          title: "Shift Type",
                          controller: _shiftType,
                          loadData:() async => ["General","Other"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Shift Name",
                          controller: _shiftName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Start Time",
                          controller: _startTime,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "End Time",
                          controller: _endTime,
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
                        print('${_shiftType.text}\n${_shiftName.text}\n${_startTime.text}\n${_endTime.text}');
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
