import 'package:flutter/material.dart';
import 'package:wallbreakersui/widgets.dart';
import 'package:wallbreakersui/data/data.dart';
class ExpectingTaxi extends StatefulWidget {
  @override
  _ExpectingTaxiState createState() => _ExpectingTaxiState();
}

class _ExpectingTaxiState extends State<ExpectingTaxi> {
  CustomTextFieldController _serviceName = CustomTextFieldController();
  CustomTextFieldController _carRegistration = CustomTextFieldController();
  CustomTextFieldController _date = CustomTextFieldController();
  CustomTextFieldController _expectedTime = CustomTextFieldController();





  bool _validate() {
    return _serviceName.isValid &&
        _carRegistration.isValid &&
        _date.isValid &&
        _expectedTime.isValid ;



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



                        CustomDropDownList<String>(
                          title: "Service Name",
                          controller: _serviceName,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "Car Registration",
                          controller: _carRegistration,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Date",
                          controller: _date,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Expected Time",
                          controller: _expectedTime,
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


