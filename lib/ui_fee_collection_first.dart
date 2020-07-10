import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';



class FeeCollectionFirst extends StatefulWidget {
  @override
  _FeeCollectionFirstState createState() => _FeeCollectionFirstState();
}

class _FeeCollectionFirstState extends State<FeeCollectionFirst> {

  CustomTextFieldController _idCardNumber = CustomTextFieldController();
  CustomTextFieldController _virtualRoomId = CustomTextFieldController();
  CustomTextFieldController _userName = CustomTextFieldController();
  CustomTextFieldController _feePlanType = CustomTextFieldController();
  CustomTextFieldController _feePlanName = CustomTextFieldController();
  CustomTextFieldController _paymentPeriodType= CustomTextFieldController();
  CustomTextFieldController _paymentPeriodName = CustomTextFieldController();
  CustomTextFieldController _periodStartDate = CustomTextFieldController();
  CustomTextFieldController _periodEndDate = CustomTextFieldController();


  bool _validate() {
    return _idCardNumber.isValid &&
        _virtualRoomId.isValid &&
        _userName.isValid &&
        _feePlanType.isValid &&
        _feePlanName.isValid &&
        _paymentPeriodType.isValid &&
        _paymentPeriodName.isValid &&
        _periodStartDate.isValid &&
        _periodEndDate.isValid;
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
                    InAppTitle(title: 'Fee Collection',),
                    Column(
                      children: <Widget>[

                        CustomTextField(
                          title: "ID Card Number",
                          controller: _idCardNumber,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),


                        CustomTextField(
                          title: "Virtual Room ID",
                          controller: _virtualRoomId,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "User Name",
                          controller: _userName,
                          validate: Validate.withOption(
                              isRequired: true,

                          ),
                        ),
                        CustomTextField(
                          title: "Fee Plan Type",
                          controller: _feePlanType,
                          validate: Validate.withOption(
                              isRequired: true,

                          ),
                        ),
                        CustomTextField(
                          title: "Fee Plan Name",
                          controller: _feePlanName,
                          validate: Validate.withOption(
                              isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Payment Period Type",
                          controller: _paymentPeriodType,
                          validate: Validate.withOption(
                              isRequired: true,

                          ),
                        ),
                        CustomTextField(
                          title: "Payment Period Name",
                          controller: _paymentPeriodName,
                          validate: Validate.withOption(
                              isRequired: true,

                          ),
                        ),
                        CustomTextField(
                          title: "Period Start date",
                          controller: _periodStartDate,
                          validate: Validate.withOption(
                              isRequired: true,

                          ),
                        ),
                        CustomTextField(
                          title: "Period End Date",
                          controller: _periodEndDate,
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
