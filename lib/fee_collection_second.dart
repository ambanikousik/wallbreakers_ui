import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';



class FeeCollectionSecond extends StatefulWidget {
  @override
  _FeeCollectionSecondState createState() => _FeeCollectionSecondState();
}

class _FeeCollectionSecondState extends State<FeeCollectionSecond> {

  CustomTextFieldController _feeAmount = CustomTextFieldController();
  CustomTextFieldController _transportFee = CustomTextFieldController();
  CustomTextFieldController _lateFeeAmount = CustomTextFieldController();
  CustomTextFieldController _lateFeeAmountAgreed = CustomTextFieldController();
  CustomTextFieldController _balancedPayment = CustomTextFieldController();


  bool _validate() {
    return
        _feeAmount.isValid &&
        _transportFee.isValid &&
        _lateFeeAmount.isValid &&
        _lateFeeAmountAgreed.isValid &&
        _balancedPayment.isValid;
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
                          title: "Fee Amount",
                          controller: _feeAmount,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),


                        CustomTextField(
                          title: "Transport Fee",
                          controller: _transportFee,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "Late Fee Amount",
                          controller: _lateFeeAmount,
                          validate: Validate.withOption(
                            isRequired: true,

                          ),
                        ),
                        CustomTextField(
                          title: "Late Fee Amount Agreed",
                          controller: _lateFeeAmountAgreed,
                          validate: Validate.withOption(
                            isRequired: true,

                          ),
                        ),
                        CustomTextField(
                          title: "Balance Payment",
                          controller: _balancedPayment,
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
