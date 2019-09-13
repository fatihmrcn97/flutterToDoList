import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/custom_button.dart';
import 'package:to_do_list/widgets/custom_textfield.dart';

class add_event extends StatefulWidget {
  @override
  _add_eventState createState() => _add_eventState();
}

class _add_eventState extends State<add_event> {
  String _selectedDate = 'Pick date';
  String _selectedTime= "Pick a Time";
  Future _pickDate() async{
    DateTime datePick = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().add(Duration(days: -365)),
       lastDate: new DateTime.now().add(Duration(days: 365)),
    );
    if(datePick !=null)setState(() {
      _selectedDate = datePick.toString();
    });
  }
  Future _pickTime() async {
    TimeOfDay timePick = await showTimePicker(
        context: context,
        initialTime: new TimeOfDay.now(),
    );
    if(timePick != null) setState(() {
     _selectedTime =timePick.toString(); 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
              child: Text(
            "Add New Task",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          SizedBox(
            height: 24,
          ),
          CustomTextField(labelText: "Enter event name"),
          SizedBox(
            height: 12,
          ),
          CustomTextField(labelText: "Enter Description"),
          SizedBox(
            height: 12,
          ),
          _dateTimePicker(Icons.date_range,_pickDate,_selectedDate),
                 _dateTimePicker(Icons.access_time,_pickTime,_selectedTime),
          SizedBox(
            height: 24,
          ),
          _actionButton(context),
        ],
      ),
    );
  }

  Widget _dateTimePicker( IconData icon , VoidCallback onPressed,String value) {
    return FlatButton(
          padding: EdgeInsets.zero,

          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(left:12.0),
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: Theme.of(context).accentColor,
                  size: 30,
                ),
                SizedBox(width: 8,),
                Text(value,style: TextStyle(fontSize: 14))
              ],
            ),
          ),
        );
  }

  Widget _actionButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          buttonText: "Close",
        ),
        CustomButton(
          onPressed: () {},
          buttonText: "Save",
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
