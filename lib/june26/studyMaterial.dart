import 'package:flutter/material.dart';
import 'package:wallbreakersui/widgets.dart';
import 'package:wallbreakersui/data/data.dart';
class StudyMaterial extends StatefulWidget {
  @override
  _StudyMaterialState createState() => _StudyMaterialState();
}

class _StudyMaterialState extends State<StudyMaterial> {
  CustomTextFieldController _name = CustomTextFieldController();
  CustomTextFieldController _description = CustomTextFieldController();
  CustomTextFieldController _type = CustomTextFieldController();
  CustomTextFieldController _enterURL = CustomTextFieldController();
  CustomTextFieldController _document = CustomTextFieldController();







  bool _validate() {
    return _name.isValid &&
        _description.isValid &&
        _enterURL.isValid &&
        _document.isValid &&

        _type.isValid ;



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
                          title: "Description",
                          controller: _description,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Type",
                          controller: _type,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Enter URL here",
                          controller: _enterURL,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Attach Document",
                          controller: _document,
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
