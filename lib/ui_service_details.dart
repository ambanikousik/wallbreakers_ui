import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';

class ServiceDetails extends StatefulWidget {
  @override
  _ServiceDetailsState createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {



  CustomTextFieldController _serviceName = CustomTextFieldController();
  CustomTextFieldController _selectCategory = CustomTextFieldController();
  CustomTextFieldController _offeredService = CustomTextFieldController();
  CustomTextFieldController _serviceType = CustomTextFieldController();

  CustomTextFieldController _serviceAddress= CustomTextFieldController();
  CustomTextFieldController _town = CustomTextFieldController();
  CustomTextFieldController _state = CustomTextFieldController();
  CustomTextFieldController _zipCode = CustomTextFieldController();

  CustomTextFieldController _latitude = CustomTextFieldController();
  CustomTextFieldController _longitude = CustomTextFieldController();
  CustomTextFieldController _website = CustomTextFieldController();
  CustomTextFieldController _startDate = CustomTextFieldController();
  CustomTextFieldController _endDate = CustomTextFieldController();
  CustomTextFieldController _biography = CustomTextFieldController();
  CustomTextFieldController _phoneNumber = CustomTextFieldController();
  CustomTextFieldController _emailAddress = CustomTextFieldController();


  bool _associateWithComplex = false;
  bool _requestLocationUpdate = false;
  bool _deliveryService = false;
  bool _pickupService = false;
  bool _haveMembers = false;


  bool _validate() {
  return _serviceName.isValid &&
  _selectCategory.isValid &&
  _offeredService.isValid &&
  _serviceType.isValid &&

  _serviceAddress.isValid &&
  _town.isValid &&
  _state.isValid &&
  _zipCode.isValid &&

  _latitude.isValid &&
  _longitude.isValid &&
  _website.isValid &&
  _startDate.isValid &&
      _endDate.isValid &&
      _biography.isValid &&
      _phoneNumber.isValid &&
      _emailAddress.isValid;
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
                    InAppTitle(title: 'Service Details',),
                    Column(
                      children: <Widget>[

                        CustomTextField(
                          title: "Service Name",
                          controller: _serviceName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "select Category",
                          controller: _selectCategory,
                          loadData:() async => ["Car Service","Roam Service","Water Service"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "select Offered Services",
                          controller: _offeredService,
                          loadData:() async => ["Home Delivery","pick up","Shifting"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Select Service Type",
                          controller: _serviceType,
                          loadData:() async => ["Paid","Free"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomSwitch(
                          title: "Associate with existing complex",
                          isEnabled: _associateWithComplex,
                          onChange: (x){ _associateWithComplex = x;},
                        ),


                        CustomTextField(
                          title: "Service Address",
                          controller: _serviceAddress,
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

                        CustomTextField(
                          title: "State",
                          controller: _state,
                          validate: Validate.withOption(
                            isRequired: true,

                          ),
                        ),
                        CustomTextField(
                          title: "Zip Code",
                          controller: _zipCode,
                          validate: Validate.withOption(
                            isRequired: true,

                          ),
                        ),
                        CustomSwitch(
                          title: "Request location update",
                          isEnabled: _requestLocationUpdate,
                          onChange: (x){ _requestLocationUpdate = x;},
                        ),
                        CustomTextField(
                          title: "latitude",
                          controller: _latitude,
                          validate: Validate.withOption(
                            isRequired: false,

                          ),
                        ),
                        CustomTextField(
                          title: "longitude",
                          controller: _longitude,
                          validate: Validate.withOption(
                            isRequired: false,

                          ),
                        ),

                        CustomTextField(
                          title: "Website(Optional)",
                          controller: _website,
                          validate: Validate.withOption(
                            isRequired: false,

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
                          title: "Biography",
                          controller: _biography,
                          validate: Validate.withOption(
                            isRequired: false,

                          ),
                        ),
                        CustomTextField(
                          title: "Phone Number",
                          controller: _phoneNumber,
                          validate: Validate.withOption(
                              isRequired: false,
                              isNumber: true

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
                        CustomSwitch(
                          title: "Delivery Service",
                          isEnabled: _deliveryService,
                          onChange: (x){ _deliveryService = x;},
                        ),
                        CustomSwitch(
                          title: "Pickup Service",
                          isEnabled: _pickupService,
                          onChange: (x){ _pickupService = x;},
                        ),
                        CustomSwitch(
                          title: "Have Members",
                          isEnabled: _haveMembers,
                          onChange: (x){ _haveMembers = x;},
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
                        print('${_serviceName.text}\n${_selectCategory.text}\n${_offeredService.text}\n${_serviceType.text}\n${_serviceName.text}\n${_town.text}\n${_state.text}\n${_startDate.text}\n${_endDate.text}\n${_zipCode.text}\n${_latitude.text}\n${_longitude.text}\n${_emailAddress.text}\n${_phoneNumber.text}\n${_website.text}\n${_biography.text}\n$_requestLocationUpdate\n$_associateWithComplex\n$_deliveryService\n$_pickupService\n$_haveMembers');
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
