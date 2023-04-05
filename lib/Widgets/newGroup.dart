import 'dart:html';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:talatna1/Objects/friends_object.dart';

import '../Objects/tal\'aa.dart';

class NewGroup extends StatefulWidget {
  final Function _addGroup;
  var titleController = TextEditingController();
  final List<Friend> _dataList;

  NewGroup(
    this._addGroup,
    this.titleController,
    this._dataList,
  );

  @override
  State<NewGroup> createState() => _NewTalaaState();
}

class _NewTalaaState extends State<NewGroup> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _submitData() {
    final titleEntered = widget.titleController.text;
    if (titleEntered.isEmpty) {
      return;
    }
    List<Friend> _selectedDataList =
        widget._dataList.where((data) => data.isSelected).toList();
    widget._addGroup(
      titleEntered,
      _selectedDataList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Title:",
                border: OutlineInputBorder(),
              ),
              controller: widget.titleController,
              onChanged: (value) => {},
              onSubmitted: (_) {
                _submitData();
              },
            ),
            Container(
              height: 150,
              child: ListView.builder(
                itemCount: widget._dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    title: Text(widget._dataList[index].userName),
                    value: widget._dataList[index].isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        widget._dataList[index].isSelected = value!;
                      });
                    },
                  );
                },
              ),
            ),
            TextButton(
                onPressed: _submitData,
                child: Text(
                  "Submit",
                ),
                style: TextButton.styleFrom(
                  primary: Colors.amber,
                ))
          ],
        ),
      ),
    );
  }
}
