import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';


class UiPageb extends StatefulWidget {
  @override
  _UiPagebState createState() => _UiPagebState();
}

class _UiPagebState extends State<UiPageb> {
  CustomTextFieldController _serviceProviderName = CustomTextFieldController();
  CustomTextFieldController _serviceProviderPhoneNumber = CustomTextFieldController();
  CustomTextFieldController _serviceProviderId = CustomTextFieldController();
  CustomTextFieldController _startDate = CustomTextFieldController();
  CustomTextFieldController _endDate = CustomTextFieldController();
  CustomTextFieldController _uploadPhoto = CustomTextFieldController();
  bool _regular = true;

  bool _validate() {
    return _serviceProviderName.isValid &&
        _serviceProviderPhoneNumber.isValid &&
        _serviceProviderId.isValid &&
        _startDate.isValid &&
        _endDate.isValid &&
        _uploadPhoto.isValid ;
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
                    InAppTitle(title: 'Route Trip Allocation',),
                    Column(
                      children: <Widget>[
                        CustomTextField(
                          title: "Service Provider Name",
                          controller: _serviceProviderName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Service Provider Phone Number",
                          controller: _serviceProviderPhoneNumber,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Service Provider ID",
                          controller: _serviceProviderId,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Start Date",
                          controller: _startDate,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "End Date",
                          controller: _endDate,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
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
                        print('${_serviceProviderName.text}\n${_serviceProviderId.text}\n${_serviceProviderPhoneNumber.text}\n${_startDate.text}\n${_endDate.text}\n${_uploadPhoto.text}\n$_regular');
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
