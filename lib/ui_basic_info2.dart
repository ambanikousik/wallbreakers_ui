import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class Basic2 extends StatefulWidget {
  @override
  _Basic2State createState() => _Basic2State();
}

class _Basic2State extends State<Basic2> {
  CustomTextFieldController _addressLine1 = CustomTextFieldController();
  CustomTextFieldController _addressLine2 = CustomTextFieldController();
  CustomTextFieldController _town = CustomTextFieldController();
  CustomTextFieldController _state = CustomTextFieldController();
  CustomTextFieldController _country = CustomTextFieldController();
  CustomTextFieldController _zipCode = CustomTextFieldController();





  bool _validate() {
    return _addressLine1.isValid &&
        _addressLine2.isValid &&
        _town.isValid &&
        _state.isValid &&
        _country.isValid &&
        _zipCode.isValid;


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
                    InAppTitle(title: 'Basic Info',),
                    Column(
                      children: <Widget>[


                        CustomTextField(
                          title: "Address line1",
                          controller: _addressLine1,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Address line 2",
                          controller: _addressLine2,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Town",
                          controller: _town,
                          loadData:() async => ["Uttara","Mohammmadpur","Sylhet"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "State",
                          controller: _state,
                          loadData:() async => ["Uttara","Mohammmadpur","Sylhet"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Country",
                          controller: _country,
                          loadData:() async => ["Bangladesh","Srilanka","India"],
                          displayName:(x)=> x,
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
                    title: "Cancel",
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
                    title: "Save",
                    isExpanded: true,
                    margin: EdgeInsets.only(left: 8, bottom: 24, right:24, top: 44),
                    onTap: (){
                      if(_validate()){
                        print('${_addressLine1.text}\n${_addressLine2.text}\n${_town.text}\n${_state.text}\n${_country.text}\n${_zipCode.text}');
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
