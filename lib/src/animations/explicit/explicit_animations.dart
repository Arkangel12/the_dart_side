import 'package:flutter/material.dart';

class ExplicitAnimations extends StatefulWidget {
  @override
  _ExplicitAnimationsState createState() => _ExplicitAnimationsState();
}

class _ExplicitAnimationsState extends State<ExplicitAnimations> {
  bool reverse = false;
  Tween<double> _myTween = Tween(begin: 0, end: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          color: Colors.white,
          child: TweenAnimationBuilder<double>(
            duration: const Duration(seconds: 2),
            onEnd: () {
              setState(() {
                if (reverse)
                  _myTween = Tween(begin: 0, end: 1);
                else
                  _myTween = Tween(begin: 1, end: 0);
                reverse = !reverse;
              });
            },
            builder: (context, value, _) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: MyItem(
                    value: value,
                  )),
                  Expanded(
                      child: MyItem(
                    value: value,
                  )),
                  Expanded(
                      child: MyItem(
                    value: value,
                  )),
                ],
              );
            },
            tween: _myTween,
          ),
        ),
      ),
    );
  }
}

class MyItem extends StatelessWidget {
  final double value;

  const MyItem({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey[400],
              Colors.red,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [
              0.0 + value,
              0.3 + value,
            ],
          ),
        ),
      ),
    );
  }
}
