import 'package:flutter/material.dart';

class NavigationRailExample extends StatefulWidget {
  @override
  _NavigationRailExampleState createState() => _NavigationRailExampleState();
}

class _NavigationRailExampleState extends State<NavigationRailExample> {
  int selectedIndex = 0;
  bool isExtended = false;
  PageController _controller = PageController();

  _changeIndex(int index) {
    _controller.jumpToPage(index);
    setState(() {
      selectedIndex = index;
    });
  }

  _changeExtendedState() {
    setState(() {
      isExtended = !isExtended;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Rail'),
      ),
      body: Row(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              _changeExtendedState();
            },
            child: NavigationRail(
              extended: isExtended,
              backgroundColor: Colors.grey[500],
              labelType: NavigationRailLabelType.none,
              selectedIndex: selectedIndex,
              selectedLabelTextStyle: TextStyle(color: Colors.black),
              selectedIconTheme: IconThemeData(color: Colors.black),
              onDestinationSelected: (index){
                _changeIndex(index);
              },
              destinations: [
                NavigationRailDestination(icon: Icon(Icons.add), label: Text('Add')),
                NavigationRailDestination(icon: Icon(Icons.clear), label: Text('Clear')),
              ],
            ),
          ),
          Expanded(
            child: _pages(),
//            child: Container(
//              alignment: Alignment.center,
//              child: Text('Selected Index: $selectedIndex'),
//            ),
          )
        ],
      ),
    );
  }

  Widget _pages() {
    return PageView(
      controller: _controller,
      children: <Widget>[
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: Text('index $selectedIndex'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text('index $selectedIndex'),
        ),
      ],
    );
  }
}
