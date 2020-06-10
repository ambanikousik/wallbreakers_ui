import 'package:flutter/material.dart';
import 'package:wallbreakersui/widgets.dart';
import 'package:wallbreakersui/data/data.dart';

class VehicleInfo extends StatefulWidget {
  @override
  _VehicleInfoState createState() => _VehicleInfoState();
}

class _VehicleInfoState extends State<VehicleInfo> {
  CustomTextFieldController _ownersName = CustomTextFieldController();
  CustomTextFieldController _unitNumber= CustomTextFieldController();
  CustomTextFieldController _numberPlate = CustomTextFieldController();
  CustomTextFieldController _registrationNo  = CustomTextFieldController();
  CustomTextFieldController _vehicleType = CustomTextFieldController();
  CustomTextFieldController _uploadPhoto = CustomTextFieldController();

  bool _validate() {
    return _ownersName.isValid &&
        _unitNumber.isValid &&
        _numberPlate.isValid &&
        _registrationNo.isValid &&
        _vehicleType.isValid &&
        _uploadPhoto.isValid ;


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
                          title: "Owner's Name",
                          controller: _ownersName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Unit Number",
                          controller: _unitNumber,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "Number Plate",
                          controller: _numberPlate,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Registration No.",
                          controller: _registrationNo,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Vehicle Type",
                          controller: _vehicleType,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Upload Photo",
                          controller: _uploadPhoto,
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

          ],
        ),
      ),
    );
  }
}
