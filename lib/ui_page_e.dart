import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';



class UiPageE extends StatefulWidget {
  @override
  _UiPageEState createState() => _UiPageEState();
}

class _UiPageEState extends State<UiPageE> {

  CustomTextFieldController _routeTripId = CustomTextFieldController();
  CustomTextFieldController _creationDate = CustomTextFieldController();
  CustomTextFieldController _primaryIdMember = CustomTextFieldController();
  CustomTextFieldController _secondaryIdmember = CustomTextFieldController();
  CustomTextFieldController _vehicleId = CustomTextFieldController();
  CustomTextFieldController _deviceId= CustomTextFieldController();
  CustomTextFieldController _startDate = CustomTextFieldController();
  CustomTextFieldController _enddate = CustomTextFieldController();
  bool _regular = true;

  bool _validate() {
    return _routeTripId.isValid &&
        _creationDate.isValid &&
        _primaryIdMember.isValid &&
        _secondaryIdmember.isValid &&
        _vehicleId.isValid &&
        _deviceId.isValid &&
        _startDate.isValid &&
        _enddate.isValid;
  }
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Service Provider',
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
                    InAppTitle(title: 'Route Trip Relations',),
                    Column(
                      children: <Widget>[
                        CustomDropDownList<String>(
                          title: "Route Trip ID",
                          controller: _routeTripId,
                          loadData:() async => ["Goa5reydf","Mumbai5re","Dhakat5r"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Creation Date",
                          controller: _creationDate,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),


                        CustomTextField(
                          title: "Primary ID Member",
                          controller: _primaryIdMember,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "Secondary ID Member",
                          controller: _secondaryIdmember,
                          validate: Validate.withOption(
                              isRequired: true,
                              isNumber: true
                          ),
                        ),
                        CustomTextField(
                          title: "Vehicle ID",
                          controller: _vehicleId,
                          validate: Validate.withOption(
                              isRequired: true,
                              isNumber: true
                          ),
                        ),
                        CustomTextField(
                          title: "Device ID",
                          controller: _deviceId,
                          validate: Validate.withOption(
                              isRequired: true,
                              isNumber: true
                          ),
                        ),
                        CustomTextField(
                          title: "Start Date",
                          controller: _startDate,
                          validate: Validate.withOption(
                              isRequired: true,
                              isNumber: true
                          ),
                        ),
                        CustomTextField(
                          title: "End Date",
                          controller: _enddate,
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
                        print('${_routeTripId.text}\n${_creationDate.text}\n${_primaryIdMember.text}\n${_secondaryIdmember.text}\n${_vehicleId.text}\n${_deviceId.text}\n${_startDate.text}\n${_enddate.text}\n$_regular');
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
