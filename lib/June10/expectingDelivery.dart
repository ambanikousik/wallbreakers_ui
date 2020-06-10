import 'package:flutter/material.dart';
import 'package:wallbreakersui/widgets.dart';
import 'package:wallbreakersui/data/data.dart';
class ExpectingDeliveries extends StatefulWidget {
  @override
  _ExpectingDeliveriesState createState() => _ExpectingDeliveriesState();
}

class _ExpectingDeliveriesState extends State<ExpectingDeliveries> {
  CustomTextFieldController _name = CustomTextFieldController();
  CustomTextFieldController _date = CustomTextFieldController();
  CustomTextFieldController _time  = CustomTextFieldController();
  CustomTextFieldController _deliveryNote = CustomTextFieldController();


  bool _validate() {
    return _name.isValid &&
        _time.isValid &&
        _deliveryNote.isValid &&
        _date.isValid ;


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
                          title: "Name",
                          controller: _name,
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
                          title: "Time",
                          controller: _time,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Delivery Note",
                          controller: _deliveryNote,
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
