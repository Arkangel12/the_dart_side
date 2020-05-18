import 'package:flutter/material.dart';
import 'package:the_dart_side/src/firestore/user.dart';

import 'my_detail_logic.dart';

const separator = const SizedBox(
  height: 25,
);

class Sample2Detail extends StatefulWidget {
  Sample2Detail({Key key, this.user}) : super(key: key);
  final User user;

  @override
  _Sample1DetailState createState() => _Sample1DetailState();
}

class _Sample1DetailState extends State<Sample2Detail> {
  MyDetailLogic myLogic;

  void onSave() {
    myLogic.save();
    Navigator.pop(context, true);
  }

  void onDelete() {
    myLogic.delete();
    Navigator.pop(context, true);
  }

  @override
  void initState() {
    myLogic = MyDetailLogic(widget.user);
    myLogic.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          if (widget.user != null)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: myLogic.textControllerName,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            separator,
            TextField(
              onChanged: myLogic.onEmailChanged,
              controller: myLogic.textControllerEmail,
              decoration: InputDecoration(
                labelText: 'Email',
                suffixIcon: ValueListenableBuilder<bool>(
                  valueListenable: myLogic.valid,
                  builder: (_, value, __) {
                    return value == null
                        ? SizedBox(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator(),
                          )
                        : value
                            ? Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.check_circle_outline,
                                color: Colors.red,
                              );
                  },
                ),
              ),
            ),
            separator,
            ValueListenableBuilder<bool>(
              valueListenable: myLogic.valid,
              builder: (_, value, __) {
                return RaisedButton(
                  child: Text('Save'),
                  onPressed: value != null && value ? () => onSave() : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
