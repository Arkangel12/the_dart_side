import 'package:flutter/material.dart';

class CurveMenu extends StatefulWidget {
  @override
  _CurveMenuState createState() => _CurveMenuState();
}

class _CurveMenuState extends State<CurveMenu> {
  PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 9,
                child: PageView(
                  controller: _controller,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 50,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              child: Image.network(
                                  'https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png'),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: ListView(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 40,),
                              shrinkWrap: true,
                              children: <Widget>[
                                Text(
                                  'What is Lorem Ipsum?',
                                  style: TextStyle(color: Colors.black, fontSize: 24),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                  style: TextStyle(color: Colors.orange),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                                  child: Placeholder(fallbackHeight: 50,color: Colors.brown,),
                                ),
                                Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                                  style: TextStyle(color: Colors.black, letterSpacing: 1.5, wordSpacing: 2.5),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.email,
                        color: Colors.black,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _controller.animateToPage(0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.linearToEaseOut);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blueGrey.withOpacity(.4),
                                    offset: Offset(2, 10),
                                    spreadRadius: 3,
                                    blurRadius: 9,
                                  ),
                                ]),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _controller.animateToPage(1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.linearToEaseOut);
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _controller.animateToPage(2,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.linearToEaseOut);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey.withOpacity(.4),
                                  offset: Offset(2, 10),
                                  spreadRadius: 3,
                                  blurRadius: 9,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 150);

    var firstControlPoint = Offset(size.width * .1, size.height);
    var firstEndPoint = Offset(size.width * .3, size.height - 100.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * .5, size.height - 200);
    var secondEndPoint = Offset(size.width * .7, size.height - 100.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width * .9, size.height);
    var thirdEndPoint = Offset(size.width, size.height - 150.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
