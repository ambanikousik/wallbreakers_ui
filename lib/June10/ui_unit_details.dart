import 'package:flutter/material.dart';
import '../widgets.dart';
import '../data/data.dart';

class UnitDetails extends StatefulWidget {
  @override
  _UnitDetailsState createState() => _UnitDetailsState();
}

class _UnitDetailsState extends State<UnitDetails> {
  CustomTextFieldController _address = CustomTextFieldController();
  CustomTextFieldController _buildingName = CustomTextFieldController();
  CustomTextFieldController _floorNumber = CustomTextFieldController();
  CustomTextFieldController _noVisitorParking = CustomTextFieldController();
  CustomTextFieldController _noFixedParking = CustomTextFieldController();


  bool _validate() {
    return _address.isValid &&
        _buildingName.isValid &&
        _floorNumber.isValid &&
        _noVisitorParking.isValid &&
        _noFixedParking.isValid ;

  }
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    Column(
                      children: <Widget>[
                        CustomTextField(
                          title: "Address",
                          controller: _address,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Building Name",
                          controller: _buildingName,
                          loadData:() async => ["Ashalota","Bonolota","Harishek"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Floor Number",
                          controller: _floorNumber,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Number of Visitor Parking",
                          controller: _noVisitorParking,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Number of Fixed  Parking",
                          controller: _noFixedParking,
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
                        print('${_address.text}\n${_buildingName.text}\n${_floorNumber.text}\n${_noFixedParking.text}\n${_noVisitorParking.text}');
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
