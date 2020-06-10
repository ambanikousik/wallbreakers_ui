import 'package:flutter/material.dart';
import '../widgets.dart';
import '../data/data.dart';
class Shift4 extends StatefulWidget {
  @override
  _Shift4State createState() => _Shift4State();
}

class _Shift4State extends State<Shift4> {

  CustomTextFieldController _startTime = CustomTextFieldController();
  CustomTextFieldController _endTime = CustomTextFieldController();


  bool _validate() {
    return _startTime.isValid &&

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
                        print('${_startTime.text}\n${_endTime.text}');
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
