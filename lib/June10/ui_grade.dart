import 'package:flutter/material.dart';
import '../widgets.dart';
import '../data/data.dart';


class Grade extends StatefulWidget {
  Grade() : super();
  @override
  _GradeState createState() => _GradeState();
}

class _GradeState extends State<Grade> {


  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

    // Both Vertical and Horozontal Scrollview for the DataTable to
    // scroll both Vertical and Horizontal...
    SingleChildScrollView _dataBody() {
      // Both Vertical and Horozontal Scrollview for the DataTable to
      // scroll both Vertical and Horizontal...
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(
                label: Text( 'ID' ),
              ),
              DataColumn(
                label: Text( 'Name' ),
              ),
              DataColumn(
                label: Text( 'Subject' ),
              ),
              // Lets add one more column to show a delete button
              DataColumn(
                label: Text( 'Grade' ),
              ),
              DataColumn(
                label: Text( 'Mark' ),
              )
            ],
            rows: [

              DataRow( cells: [
                DataCell(
                    Text( "id" ),
                    // Add tap in the row and populate the
                    // textfields with the corresponding values to update
                    onTap: () {

                    } ),


                DataCell(
                  Text( "val" ),
                  onTap: () {

                  },
                ),
                DataCell(
                  Text( "var" ),
                  onTap: () {

                  },
                ),
                DataCell(
                  Text( "var" ),
                  onTap: () {

                  },
                ),
                DataCell( IconButton(
                  icon: Icon( Icons.delete ),
                  onPressed: () {

                  },
                ) )
              ] ),
            ],

          ),
        ),
      );
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        //  key: _scaffoldKey,
        appBar: AppBar(
          title: Text( "Grade" ), // we show the progress in the title...
          actions: <Widget>[
            IconButton(
              icon: Icon( Icons.add ),
              onPressed: () {
                //  _createTable();
              },
            ),
            IconButton(
              icon: Icon( Icons.refresh ),
              onPressed: () {
                //  _getEmployees();
              },
            )
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                child: _dataBody(),
              ),
              // Add an update button and a Cancel Button
              // show these buttons only when updating an employee
              /*
            _isUpdating
                ? Row(
              children: <Widget>[
                OutlineButton(
                  child: Text('UPDATE'),
                  onPressed: () {
                 //   _updateEmployee(_selectedEmployee);
                  },
                ),
                OutlineButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    setState(() {
                      _isUpdating = false;
                    });
                    _clearValues();
                  },
                ),
              ],
            )
                : Container(),
            Expanded(
              child: _dataBody(),
            ),

             */
            ],


          ),
        ),


      );
    }
  }


