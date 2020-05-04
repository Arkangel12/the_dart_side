import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_dart_side/src/multiple_refresh/change_notifier/my_provider_detail.dart';
import 'package:the_dart_side/src/multiple_refresh/change_notifier/my_provider_list.dart';
import 'package:the_dart_side/src/multiple_refresh/change_notifier/my_provider_notifications.dart';

class SampleChangeNotifier extends StatelessWidget {
  SampleChangeNotifier._();

  static Widget init() => MultiProvider(
        child: SampleChangeNotifier._(),
        providers: [
          ChangeNotifierProvider<MyProviderNotifications>(
            create: (_) => MyProviderNotifications()..loadNotifications(),
            child: SampleChangeNotifier._(),
          ),
          ChangeNotifierProvider<MyProviderList>(
            create: (_) => MyProviderList()..loadHorizontalData(),
            child: SampleChangeNotifier._(),
          ),
          ChangeNotifierProvider<MyProviderDetail>(
            create: (_) => MyProviderDetail()..loadImageDetail(),
            child: SampleChangeNotifier._(),
          ),
        ],
      );

  void _loadNotifications(BuildContext context) {
    final provider =
        Provider.of<MyProviderNotifications>(context, listen: false);
    provider.loadNotifications();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD ...$this  ... ${DateTime.now()}");
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Notifier'),
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
    return Consumer<MyProviderNotifications>(builder: (context, provider, _) {
      final notifications = provider.notifications;
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
    final data = Provider.of<MyProviderList>(context).horizontalList;
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
    final imageDetail = Provider.of<MyProviderDetail>(context).imageDetail;
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
