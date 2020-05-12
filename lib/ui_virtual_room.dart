import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class VirtualRoom extends StatefulWidget {
  @override
  _VirtualRoomState createState() => _VirtualRoomState();
}

class _VirtualRoomState extends State<VirtualRoom> {
  CustomTextFieldController _virtualRoomName = CustomTextFieldController();
  CustomTextFieldController _virtualRoomCategory = CustomTextFieldController();
  CustomTextFieldController _sessionTermName = CustomTextFieldController();
  CustomTextFieldController _numberOfStudent = CustomTextFieldController();
  CustomTextFieldController _listOfRegisteredId = CustomTextFieldController();
  CustomTextFieldController _listOfOfferings= CustomTextFieldController();
  CustomTextFieldController _primaryOwner = CustomTextFieldController();


  bool _validate() {
    return _virtualRoomName.isValid &&
        _virtualRoomCategory.isValid &&
        _sessionTermName.isValid &&
        _numberOfStudent.isValid &&
        _listOfRegisteredId.isValid &&
        _listOfOfferings.isValid &&
        _primaryOwner.isValid ;

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
                    InAppTitle(title: 'Virtual Room',),
                    Column(
                      children: <Widget>[

                        CustomTextField(
                          title: "Virtual Room Name",
                          controller: _virtualRoomName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),





                        CustomDropDownList<String>(
                          title: "Virtual Room Category",
                          controller: _virtualRoomCategory,
                          loadData:() async => ["Double","Single","Compact"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Session term Name",
                          controller: _sessionTermName,
                          validate: Validate.withOption(
                            isRequired: true,

                          ),
                        ),
                        CustomTextField(
                          title: "Number of Student",
                          controller: _numberOfStudent,
                          validate: Validate.withOption(
                            isRequired: true,

                          ),
                        ),
                        CustomTextField(
                          title: "LIst Of Registered ID",
                          controller: _listOfRegisteredId,
                          validate: Validate.withOption(
                            isRequired: true,

                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "List Of Offerings",
                          controller: _listOfOfferings,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Primary Owner",
                          controller: _primaryOwner,
                          loadData:() async => ["A","B","C"],
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
                        print('${_virtualRoomName.text}\n${_virtualRoomCategory.text}\n${_sessionTermName.text}\n${_numberOfStudent.text}\n${_listOfRegisteredId.text}\n${_listOfOfferings.text}\n${_primaryOwner.text}');
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
