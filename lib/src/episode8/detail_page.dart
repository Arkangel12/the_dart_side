import 'package:flutter/material.dart';

import 'episode8_page.dart';

class DetailPage extends StatelessWidget {
  final Item item;
  final bool isMobile;

  const DetailPage({Key key, this.item, this.isMobile = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return item != null
        ? Scaffold(
            backgroundColor: Colors.blueGrey,
            appBar: isMobile
                ? AppBar(
                    title: Text(item.title),
                  )
                : null,
            body: Center(
              child: Text(item.description),
            ),
          )
        : Material(
            color: Colors.blueGrey,
            child: Center(
              child: Text("No item selected"),
            ),
          );
  }
}
