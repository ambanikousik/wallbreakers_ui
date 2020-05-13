import 'package:flutter/material.dart';
import 'widgets.dart';
import 'data/data.dart';
class Stuff3 extends StatefulWidget {
  @override
  _Stuff3State createState() => _Stuff3State();
}

class _Stuff3State extends State<Stuff3> {
  CustomTextFieldController _education = CustomTextFieldController();
  CustomTextFieldController _basicBio = CustomTextFieldController();
  CustomTextFieldController _category = CustomTextFieldController();


  bool _validate() {
    return _education.isValid &&
        _basicBio.isValid &&
        _category.isValid ;


  }
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Garden Square',
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
                    InAppTitle(title: 'Staff',),
                    Column(
                      children: <Widget>[


                        CustomTextField(
                          title: "Education",
                          controller: _education,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "Basic Bio",
                          controller: _basicBio,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Category",
                          controller: _category,
                          loadData:() async => ["A","B","C"],
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
                        print('${_education.text}\n${_basicBio.text}\n${_category.text}');
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
