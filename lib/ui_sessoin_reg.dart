import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class SessionReg extends StatefulWidget {
  @override
  _SessionRegState createState() => _SessionRegState();
}

class _SessionRegState extends State<SessionReg> {
  CustomTextFieldController _idCardNumber = CustomTextFieldController();
  CustomTextFieldController _virtualRoomNumber = CustomTextFieldController();
  CustomTextFieldController _activeSession = CustomTextFieldController();
  CustomTextFieldController _allocatedTransportRoute = CustomTextFieldController();
  CustomTextFieldController _allocatedTransportCast = CustomTextFieldController();
  CustomTextFieldController _feePlanType= CustomTextFieldController();
  CustomTextFieldController _feePlan = CustomTextFieldController();
  CustomTextFieldController _house = CustomTextFieldController();
  CustomTextFieldController _offeringsToken = CustomTextFieldController();
  CustomTextFieldController _offeringsSchedule = CustomTextFieldController();
  bool _isActive = true;

  bool _validate() {
    return _idCardNumber.isValid &&
        _virtualRoomNumber.isValid &&
        _activeSession.isValid &&
        _allocatedTransportRoute.isValid &&
        _allocatedTransportCast.isValid &&
        _feePlanType.isValid &&
        _feePlan.isValid &&
        _offeringsToken.isValid &&
        _offeringsSchedule.isValid &&
        _house.isValid;
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
                        CustomTextField(
                          title: "ID Card Number",
                          controller: _idCardNumber,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),


                        CustomTextField(
                          title: "Virtual Room Number",
                          controller: _virtualRoomNumber,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "Active Session",
                          controller: _activeSession,
                          validate: Validate.withOption(
                              isRequired: true,
                              isNumber: true
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Allocated Transport Route",
                          controller: _allocatedTransportRoute,
                          loadData:() async => ["Goa5reydf","Mumbai5re","Dhakat5r"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "Allocated Transport Cost",
                          controller: _allocatedTransportCast,
                          validate: Validate.withOption(
                              isRequired: true,

                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Fee Plan Type",
                          controller: _feePlanType,
                          loadData:() async => ["Yearly","Monthly","Weekly"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Fee Plan",
                          controller: _feePlan,
                          loadData:() async => ["Goa5reydf","Mumbai5re","Dhakat5r"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "House",
                          controller: _house,
                          validate: Validate.withOption(
                              isRequired: true,

                          ),
                        ),
                        CustomTextField(
                          title: "Offerings Token",
                          controller: _offeringsToken,
                          validate: Validate.withOption(
                              isRequired: true,
                              isNumber: true
                          ),
                        ),
                        CustomTextField(
                          title: "Offerings Schedule",
                          controller: _offeringsSchedule,
                          validate: Validate.withOption(
                              isRequired: true,
                              isNumber: true
                          ),
                        ),
                        CustomSwitch(
                          title: "Is Active",
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
                        print('${_idCardNumber.text}\n${_virtualRoomNumber.text}\n${_activeSession.text}\n${_allocatedTransportRoute.text}\n${_allocatedTransportCast.text}\n${_feePlanType.text}\n${_feePlan.text}\n${_house.text}\n${_offeringsToken.text}\n${_offeringsSchedule.text}\n$_isActive');
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
