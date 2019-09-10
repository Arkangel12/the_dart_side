import 'package:flutter/material.dart';

import 'detail_page.dart';

class Item {
  final String title;
  final String description;

  Item({this.title, this.description});
}

class Episode8Page extends StatefulWidget {
  @override
  _Episode8PageState createState() => _Episode8PageState();
}

class _Episode8PageState extends State<Episode8Page> {
  Item itemSelected;
  bool isMobile = false;
  final items = List.generate(
      20,
      (index) =>
          Item(title: "Title $index", description: "Description $index"));

  _openDetail(BuildContext context, Item item) {
    if (isMobile) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => DetailPage(
            item: item,
            isMobile: true,
          ),
        ),
      );
    } else {
      setState(() {
        itemSelected = item;
      });
    }
  }

  bool _isMobileLayout(double shortestSide) => shortestSide < 600;

  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    isMobile = _isMobileLayout(shortestSide);
    return Scaffold(
      appBar: AppBar(
        title: Text("Multilayout : $isMobile"),
      ),
      body: isMobile
          ? ListPage(
              items: items,
              onTapItem: (itemSelected) {
                _openDetail(context, itemSelected);
              },
            )
          : Row(
              children: [
                Expanded(
                  child: ListPage(
                    items: items,
                    onTapItem: (itemSelected) {
                      _openDetail(context, itemSelected);
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: DetailPage(
                    item: itemSelected,
                  ),
                ),
              ],
            ),
    );
  }
}

class ListPage extends StatelessWidget {
  final List<Item> items;
  final ValueChanged<Item> onTapItem;

  const ListPage({
    Key key,
    this.items,
    this.onTapItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(items[index].title),
          onTap: () => onTapItem(items[index]),
        );
      },
    );
  }
}
