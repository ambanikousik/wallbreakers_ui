import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';

class ResidentPersonal extends StatefulWidget {
  @override
  _ResidentPersonalState createState() => _ResidentPersonalState();
}

class _ResidentPersonalState extends State<ResidentPersonal> {

  CustomTextFieldController _firstName = CustomTextFieldController();
  CustomTextFieldController _lastName = CustomTextFieldController();
  CustomTextFieldController _emailAddress = CustomTextFieldController();
  CustomTextFieldController _contactNumber = CustomTextFieldController();
  CustomTextFieldController _category = CustomTextFieldController();
  CustomTextFieldController _country= CustomTextFieldController();
  CustomTextFieldController _state = CustomTextFieldController();
  CustomTextFieldController _town = CustomTextFieldController();
  CustomTextFieldController _complex = CustomTextFieldController();
  CustomTextFieldController _building = CustomTextFieldController();
  CustomTextFieldController _floor = CustomTextFieldController();
  CustomTextFieldController _unit = CustomTextFieldController();
  CustomTextFieldController _startDate = CustomTextFieldController();
  CustomTextFieldController _endDate = CustomTextFieldController();

  bool _regular = true;

  bool _validate() {
    return _firstName.isValid &&
        _lastName.isValid &&
        _emailAddress.isValid &&
        _contactNumber.isValid &&
        _category.isValid &&
        _country.isValid &&
        _state.isValid &&
        _complex.isValid &&
        _building.isValid &&
        _floor.isValid &&
        _unit.isValid &&
        _startDate.isValid &&
        _endDate.isValid &&
        _town.isValid;
  }
  @override
  Widget build(BuildContext context) {

    ScreenSize().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Resident',
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
                    InAppTitle(title: 'Resident Details',),
                    Column(
                      children: <Widget>[

                        CustomTextField(
                          title: "Country",
                          controller: _country,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),


                        CustomTextField(
                          title: "State",
                          controller: _state,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "Town",
                          controller: _town,
                          validate: Validate.withOption(
                              isRequired: true,

                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "select Complex",
                          controller: _complex,
                          loadData:() async => ["Goa5reydf","Mumbai5re","Dhakat5r"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Building",
                          controller: _building,
                          validate: Validate.withOption(
                              isRequired: true,

                          ),
                        ),
                        CustomTextField(
                          title: "Floor",
                          controller: _floor,
                          validate: Validate.withOption(
                              isRequired: true,

                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Select Unit",
                          controller: _unit,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Start Date",
                          controller: _startDate,
                          validate: Validate.withOption(
                              isRequired: true,

                          ),
                        ),
                        CustomTextField(
                          title: "End Date",
                          controller: _endDate,
                          validate: Validate.withOption(
                              isRequired: false,

                          ),
                        ),
                        CustomTextField(
                          title: "First Name",
                          controller: _firstName,
                          validate: Validate.withOption(
                            isRequired: false,

                          ),
                        ),
                        CustomTextField(
                          title: "Last Name",
                          controller: _lastName,
                          validate: Validate.withOption(
                            isRequired: false,

                          ),
                        ),
                        CustomTextField(
                          title: "Email address",
                          controller: _emailAddress,
                          validate: Validate.withOption(
                            isRequired: false,
                            isEmail: true

                          ),
                        ),
                        CustomTextField(
                          title: "Contact Number",
                          controller: _contactNumber,
                          validate: Validate.withOption(
                            isRequired: false,
                            isNumber: true

                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Category",
                          controller: _unit,
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
                        print('${_country.text}\n${_state.text}\n${_town.text}\n${_complex.text}\n${_building.text}\n${_floor.text}\n${_unit.text}\n${_startDate.text}\n${_endDate.text}\n${_category.text}\n${_firstName.text}\n${_lastName.text}\n${_emailAddress.text}\n${_contactNumber.text}');
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
