import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PackageSlidableExample extends StatefulWidget {
  @override
  _PackageSlidableExampleState createState() => _PackageSlidableExampleState();
}

class _PackageSlidableExampleState extends State<PackageSlidableExample> {
  List<String> list;

  @override
  void initState() {
    list = List.generate(20, (i) => 'Hola widgets $i');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Package Slidable Example'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (_, index) => Container(
          color: Colors.white,
          child: Slidable(
            //        actionPane: SlidableDrawerActionPane(),
            //        actionPane: SlidableScrollActionPane(),
            //        actionPane: SlidableBehindActionPane(),
            actionPane: SlidableStrechActionPane(),
            closeOnScroll: false,
            actionExtentRatio: 0.15,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigoAccent,
                child: Text('HW $index'),
                foregroundColor: Colors.white,
              ),
              title: Text(
                'Tile Hola Widgets $index',
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text(
                'SlidableDrawerDelegate',
                style: TextStyle(color: Colors.black),
              ),
            ),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Archive',
                color: Colors.blue,
                icon: Icons.archive,
                onTap: () => print('Archive'),
                closeOnTap: false,
              ),
              SlideAction(
                color: Colors.green,
                child: Text(
                  'Archive',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              IconSlideAction(
                caption: 'Share',
                color: Colors.indigo,
                icon: Icons.share,
                onTap: () => print('Share'),
              ),
            ],
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'More',
                color: Colors.black45,
                icon: Icons.more_horiz,
                onTap: () => print('More'),
              ),
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () => print('Delete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
