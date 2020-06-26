import 'package:flutter/material.dart';
import 'package:wallbreakersui/widgets.dart';
import 'package:wallbreakersui/data/data.dart';
class ReviewAssignments extends StatefulWidget {
  @override
  _ReviewAssignmentsState createState() => _ReviewAssignmentsState();
}

class _ReviewAssignmentsState extends State<ReviewAssignments> {
  CustomTextFieldController _studentName = CustomTextFieldController();
  CustomTextFieldController _totalQuestion = CustomTextFieldController();
  CustomTextFieldController _correctAnswers = CustomTextFieldController();
  CustomTextFieldController _wrongAnswers = CustomTextFieldController();
  CustomTextFieldController _unAttempted = CustomTextFieldController();







  bool _validate() {
    return _studentName.isValid &&
        _totalQuestion.isValid &&
        _correctAnswers.isValid &&
        _wrongAnswers.isValid &&

        _unAttempted.isValid ;



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
                          title: "Student Name",
                          controller: _studentName,
                          loadData:() async => ["A","B","C"],
                          displayName:(x)=> x,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Total Question",
                          controller: _totalQuestion,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Correct Answers",
                          controller: _correctAnswers,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),

                        CustomTextField(
                          title: "Wrong Answers",
                          controller: _wrongAnswers,
                          validate: Validate.withOption(
                            isRequired: true,
                          ),
                        ),
                        CustomTextField(
                          title: "Un Attempted",
                          controller: _unAttempted,
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
