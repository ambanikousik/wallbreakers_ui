import 'package:flutter/material.dart';
import 'package:wallbreakersui/widgets.dart';
import 'package:wallbreakersui/data/data.dart';
class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  CustomTextFieldController _questionText = CustomTextFieldController();
  CustomTextFieldController _addImage = CustomTextFieldController();
  CustomTextFieldController _uploadSolution = CustomTextFieldController();
  CustomTextFieldController _answers = CustomTextFieldController();








  bool _validate() {
    return _questionText.isValid &&
        _addImage.isValid &&
        _uploadSolution.isValid &&
        _answers.isValid;



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
                          title: "Question Text",
                          controller: _questionText,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Add Image",
                          controller: _addImage,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Upload Solution",
                          controller: _uploadSolution,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomDropDownList<String>(
                          title: "Answers",
                          controller: _answers,
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

          ],
        ),
      ),
    );
  }
}
