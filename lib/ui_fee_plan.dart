import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class FeePlan extends StatefulWidget {
  @override
  _FeePlanState createState() => _FeePlanState();
}

class _FeePlanState extends State<FeePlan> {
  CustomTextFieldController _feePlanName = CustomTextFieldController();
  CustomTextFieldController _description = CustomTextFieldController();
  CustomTextFieldController _termName = CustomTextFieldController();
  CustomTextFieldController _startDate = CustomTextFieldController();
  CustomTextFieldController _endDate = CustomTextFieldController();
  CustomTextFieldController _paymentPeriodType= CustomTextFieldController();
  CustomTextFieldController _discountType = CustomTextFieldController();


  bool _validate() {
    return _feePlanName.isValid &&
        _description.isValid &&
        _termName.isValid &&
        _startDate.isValid &&
        _endDate.isValid &&
        _paymentPeriodType.isValid &&
        _discountType.isValid ;

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
                    InAppTitle(title: 'Fee Plan',),
                    Column(
                      children: <Widget>[

                        CustomTextField(
                          title: "Fee Plan Name",
                          controller: _feePlanName,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Description",
                          controller: _description,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Term Name",
                          controller: _termName,
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






                        CustomDropDownList<String>(
                          title: "Payment Period Type",
                          controller: _paymentPeriodType,
                          loadData:() async => ["6months","12 months","24 months"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Dicount Type",
                          controller: _discountType,
                          loadData:() async => ["30%","20%","50%"],
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
                        print('${_feePlanName.text}\n${_description.text}\n${_termName.text}\n${_startDate.text}\n${_endDate.text}\n${_paymentPeriodType.text}\n${_discountType.text}');
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
