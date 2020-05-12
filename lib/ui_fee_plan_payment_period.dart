import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class PaymentPeriod extends StatefulWidget {
  @override
  _PaymentPeriodState createState() => _PaymentPeriodState();
}

class _PaymentPeriodState extends State<PaymentPeriod> {
  CustomTextFieldController _paymentPeriodName = CustomTextFieldController();
  CustomTextFieldController _dueDate = CustomTextFieldController();
  CustomTextFieldController _feeScheduleName = CustomTextFieldController();
  CustomTextFieldController _startDate = CustomTextFieldController();
  CustomTextFieldController _endDate = CustomTextFieldController();
  CustomTextFieldController _totalAmount= CustomTextFieldController();
  CustomTextFieldController _numberOfDays = CustomTextFieldController();


  bool _validate() {
    return _paymentPeriodName.isValid &&
        _dueDate.isValid &&
        _feeScheduleName.isValid &&
        _startDate.isValid &&
        _endDate.isValid &&
        _totalAmount.isValid &&
        _numberOfDays.isValid ;

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
                    InAppTitle(title: 'Fee Plan Payment Period',),
                    Column(
                      children: <Widget>[
                        CustomDropDownList<String>(
                          title: "Payment Period Name",
                          controller: _paymentPeriodName,
                          loadData:() async => ["6months","12 months","24 months"],
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
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Due Date",
                          controller: _dueDate,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),






                        CustomDropDownList<String>(
                          title: "Fee Schedule Name",
                          controller: _feeScheduleName,
                          loadData:() async => ["6months","12 months","24 months"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Total Amount",
                          controller: _totalAmount,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Number Of Days",
                          controller: _numberOfDays,
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
                        print('${_paymentPeriodName.text}\n${_dueDate.text}\n${_feeScheduleName.text}\n${_startDate.text}\n${_endDate.text}\n${_totalAmount.text}\n${_numberOfDays.text}');
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
