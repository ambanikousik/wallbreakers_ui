import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class FeeSchedule extends StatefulWidget {
  @override
  _FeeScheduleState createState() => _FeeScheduleState();
}

class _FeeScheduleState extends State<FeeSchedule> {
  CustomTextFieldController _feeItemName = CustomTextFieldController();
  CustomTextFieldController _amount = CustomTextFieldController();
  CustomTextFieldController _tax = CustomTextFieldController();
  bool _isProrated = true;
  bool _isDiscountApplicable = true;

  bool _validate() {
    return _feeItemName.isValid &&
        _amount.isValid &&
        _tax.isValid ;


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
                    InAppTitle(title: 'Fee Schedule',),
                    Column(
                      children: <Widget>[
                        CustomDropDownList<String>(
                          title: "Fee Item Name",
                          controller: _feeItemName,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "Amount",
                          controller: _amount,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Tax",
                          controller: _tax,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomSwitch(
                          title: "Is Prorated",
                          isEnabled: _isProrated,
                          onChange: (x){ _isProrated = x;},
                        ),
                        CustomSwitch(
                          title: "Is Discount applicable",
                          isEnabled: _isDiscountApplicable,
                          onChange: (x){ _isDiscountApplicable = x;},
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
                        print('${_feeItemName.text}\n${_amount.text}\n${_tax.text}\n$_isProrated\n$_isDiscountApplicable');
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
