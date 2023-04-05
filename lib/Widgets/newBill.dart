import 'dart:html';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:talatna1/Objects/friends_object.dart';

import '../Objects/tal\'aa.dart';

class NewBill extends StatefulWidget {
  final Function _addBill;
  var titleController = TextEditingController();
  final List<Talaa> _dataList;

  NewBill(
    this._addBill,
    this.titleController,
    this._dataList,
  );

  @override
  State<NewBill> createState() => _NewTalaaState();
}

class _NewTalaaState extends State<NewBill> {
  Talaa? selectedTalaa;
  void _submitData() {
    final titleEntered = widget.titleController.text;
    if (titleEntered.isEmpty) {
      return;
    }
    widget._addBill(titleEntered, selectedTalaa);
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
                  return RadioListTile<Talaa>(
                    title: Text(widget._dataList[index].name),
                    value: widget._dataList[index],
                    groupValue: selectedTalaa,
                    onChanged: (Talaa? value) {
                      setState(() {
                        selectedTalaa = value;
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
