import 'package:flutter/material.dart';
import 'dart:math';

class SampleStateful extends StatefulWidget {
  @override
  _SampleStatefulState createState() => _SampleStatefulState();
}

class _SampleStatefulState extends State<SampleStateful> {
  List<String> _horizontalList;
  int _notifications;
  String _imageDetail;

  void _loadHorizontalData() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _horizontalList = List.generate(
          20, (index) => "https://picsum.photos/id/$index/200/300");
    });
  }

  void _loadNotifications() async {
    setState(() {
      _notifications = null;
    });
    await Future.delayed(const Duration(seconds: 2));
    final random = Random();
    setState(() {
      _notifications = random.nextInt(80);
    });
  }

  void _loadImageDetail() async {
    await Future.delayed(const Duration(seconds: 4));
    setState(() {
      _imageDetail = "https://picsum.photos/250/250?grayscale";
    });
  }

  void _loadInitialData() {
    _loadHorizontalData();
    _loadNotifications();
    _loadImageDetail();
  }

  @override
  void initState() {
    _loadInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD ...$this  ... ${DateTime.now()}");
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _loadNotifications,
          ),
          NotificationWidget(
            notifications: _notifications,
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: const BackgroundImage(),
          ),
          Column(
            children: [
              Expanded(
                child: HorizontalWidget(
                  data: _horizontalList,
                ),
              ),
              Expanded(
                flex: 2,
                child: DetailWidget(
                  imageDetail: _imageDetail,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  final int notifications;

  const NotificationWidget({Key key, this.notifications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BUILD ...$this  ... ${DateTime.now()}");
    return CircleAvatar(
      backgroundColor: Colors.redAccent,
      child: notifications != null
          ? Text(
              notifications.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            )
          : loadingWidget,
    );
  }
}

class HorizontalWidget extends StatelessWidget {
  final List<String> data;

  const HorizontalWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BUILD ...$this  ... ${DateTime.now()}");
    return data != null
        ? ListView.builder(
            itemCount: 20,
            itemExtent: 180,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.network(data[index]),
              ),
            ),
          )
        : loadingWidget;
  }
}

class DetailWidget extends StatelessWidget {
  final String imageDetail;

  const DetailWidget({Key key, this.imageDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BUILD ...$this  ... ${DateTime.now()}");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageDetail != null
              ? ClipOval(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.network(imageDetail),
                )
              : loadingWidget,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Featured Image'),
          ),
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage();

  @override
  Widget build(BuildContext context) {
    print("BUILD ...$this  ... ${DateTime.now()}");
    return Image.network(
      'https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg',
      fit: BoxFit.cover,
    );
  }
}

const loadingWidget = Center(
  child: CircularProgressIndicator(),
);
