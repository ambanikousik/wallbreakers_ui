import 'package:flutter/material.dart';
import 'package:wallbreakersui/model/models.dart';
import 'package:wallbreakersui/data/data.dart';

class CustomDatePicker extends StatefulWidget {
  List<Day> days;

  CustomDatePicker({@required this.days}) : assert(days != null);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.symmetric(vertical: height*2,horizontal: width*6),
          child: Text('Select Days of Week',style: TextStyle(color: C.primaryTextGray,fontSize: 18),),
        ),
        Container(
          height: height * 9,
          width: width * 100,
          child: Center(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.days.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Container(
                    width: width * 9,
                    decoration: BoxDecoration(
                        color: widget.days[index].isSelected
                            ? Colors.blue
                            : Colors.black12,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(width * 2),
                            bottomRight: Radius.circular(width * 2))),
                    child: Center(
                        child: Text(
                      widget.days[index].day,
                      style: TextStyle(
                          color: widget.days[index].isSelected ? white : black,
                          fontSize: width * 6),
                    )),
                  ),
                  onTap: () {
                    setState(() {
                      widget.days[index].isSelected
                          ? widget.days[index].isSelected = false
                          : widget.days[index].isSelected = true;
                    });
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: width * 4.7,
                );
              },
            ),
          ),
          margin: EdgeInsets.only(bottom: width * 2),
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: Offset(0.0, -height), //(x,y)
                blurRadius: height,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
