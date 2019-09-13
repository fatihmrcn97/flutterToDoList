import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/custom_button.dart';
import 'package:to_do_list/widgets/custom_textfield.dart';

class add_Task_page extends StatefulWidget {
  @override
  _add_Task_pageState createState() => _add_Task_pageState();
}

class _add_Task_pageState extends State<add_Task_page> {
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
            SizedBox(height: 24,),
            CustomTextField(  labelText: "Enter a Task Name"),
                      SizedBox(height: 24,
                      ),
            _actionButton(context),
        ],
      ),
    );
  }

 Widget _actionButton(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomButton(
              onPressed: (){ 
                Navigator.of(context).pop();
              },
              buttonText: "Close",
             
              ),
              CustomButton(
              onPressed: (){ },
              buttonText: "Save",
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              ),                           
            ],
          );
  }
}
