import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget implements PreferredSizeWidget {
  final Widget leftIcon;
  final Function leftFunction;
  final String title;

  const MyHeader({Key key, this.leftIcon, this.leftFunction, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.red,
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 4,
              child: InkWell(
                onTap: leftFunction ?? ()=> Navigator.pop(context),
                child: Container(
                  child: leftIcon ?? Icon(Icons.arrow_back_ios),
                ),
              )),
          Expanded(
            flex: 6,
            child: Container(
              alignment: Alignment.center,
              child: Text(title),
            ),
          ),
          Expanded(flex: 4, child: Container()),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
