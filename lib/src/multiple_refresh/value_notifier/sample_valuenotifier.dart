import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_dart_side/src/multiple_refresh/value_notifier/my_provider.dart';

class SampleValueNotifier extends StatelessWidget {
  SampleValueNotifier._();

  static Widget init() {
    final myProvider = MyProvider();
    myProvider.loadData();
    return MultiProvider(
      child: SampleValueNotifier._(),
      providers: [
        Provider<MyProvider>(
          create: (_) => myProvider,
        ),
        ValueListenableProvider<List<String>>(
          create: (_) => myProvider.horizontalList,
        ),
        ValueListenableProvider<int>(
          create: (_) => myProvider.notifications,
        ),
        ValueListenableProvider<String>(
          create: (_) => myProvider.imageDetail,
        ),
      ],
    );
  }

  void _loadNotifications(BuildContext context) {
    final provider = Provider.of<MyProvider>(context, listen: false);
    provider.loadNotifications();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD ...$this  ... ${DateTime.now()}");
    return Scaffold(
      appBar: AppBar(
        title: Text('Value Notifier'),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () => _loadNotifications(context)),
          NotificationWidget(),
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
                child: HorizontalWidget(),
              ),
              Expanded(
                flex: 2,
                child: DetailWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<int>(builder: (context, notifications, _) {
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
    });
  }
}

class HorizontalWidget extends StatelessWidget {
  const HorizontalWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BUILD ...$this  ... ${DateTime.now()}");
    final data = Provider.of<List<String>>(context);
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
  const DetailWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BUILD ...$this  ... ${DateTime.now()}");
    final imageDetail = Provider.of<String>(context);
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
