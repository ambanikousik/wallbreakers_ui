import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';

class BuildingDetails extends StatefulWidget {
  @override
  _BuildingDetailsState createState() => _BuildingDetailsState();
}

class _BuildingDetailsState extends State<BuildingDetails> {
  CustomTextFieldController _buildingName = CustomTextFieldController();
  CustomTextFieldController _latitude = CustomTextFieldController();
  CustomTextFieldController _longitude = CustomTextFieldController();
  CustomTextFieldController _attachedGate = CustomTextFieldController();


  bool _validate() {
    return _buildingName.isValid &&
        _latitude.isValid &&
        _longitude.isValid &&
        _attachedGate.isValid ;

  }
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Complex Manager',
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
                    InAppTitle(title: 'Building Details',),
                    Column(
                      children: <Widget>[
                        CustomTextField(
                          title: "Building Name",
                          controller: _buildingName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "Latitude",
                          controller: _latitude,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Longitude",
                          controller: _longitude,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Attached Gate",
                          controller: _attachedGate,
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
                    title: "Define Unit",
                    isExpanded: true,
                    margin: EdgeInsets.only(left: 8, bottom: 24, right:24, top: 44),
                    onTap: (){
                      if(_validate()){
                        print('${_buildingName.text}\n${_latitude.text}\n${_longitude.text}\n${_attachedGate.text}');
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
