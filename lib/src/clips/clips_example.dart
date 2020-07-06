import 'package:flutter/material.dart';

class ClipsExample extends StatefulWidget {
  @override
  _ClipsExampleState createState() => _ClipsExampleState();
}

class _ClipsExampleState extends State<ClipsExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clips'),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(color: Colors.green),
          ), // Detras de la imagen
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () => print('Es un octagono, no un hexagono!'),
              child: ClipPath(
                clipper: const MyClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height /2,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                  /*child: Image.asset(
                    'assets/images/dash_vader_white.png',
                    height: MediaQuery.of(context).size.height /2,
                  ),*/
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  final int layers;
  const MyClipper({this.layers = 3});

  @override
  Path getClip(Size size) {
    print(size); // Size del child dentro del ClipPath
    final Path path = Path()
      ..moveTo(size.width * .2, 0)
      ..lineTo(0, size.height * .2)
      ..lineTo(0, size.height * .8)
      ..lineTo(0, size.height)
      ..lineTo(size.width * .8, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height * .2)
      ..lineTo(size.width * .8, 0)
      ..close();

    return path;
  }
  @override
  bool shouldReclip(MyClipper oldClipper) => oldClipper.layers != layers;
}
