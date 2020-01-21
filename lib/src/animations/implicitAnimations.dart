import 'package:flutter/material.dart';

class ImplicitAnimations extends StatefulWidget {
  @override
  _ImplicitAnimationsState createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  bool fullSize = false;
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animaciones Implicitas'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.bounceOut,
          color: Colors.blue,
          height: fullSize ? MediaQuery.of(context).size.height : 200,
          width: fullSize ? MediaQuery.of(context).size.width : 200,
          alignment: fullSize ? Alignment.topCenter : Alignment.center,
          child: GestureDetector(
            onTap: (){
              setState(() {
                fullSize = !fullSize;
                opacity = opacity == 1.0 ? .2 : 1.0;
              });
            },
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              curve: Curves.bounceInOut,
              opacity: opacity,
              child: Text(
                'Hola Flutterians', style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
