import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_dart_side/src/animations/implicit/implicit_animations.dart';
import 'package:the_dart_side/src/api_call/albumProvider.dart';
import 'package:the_dart_side/src/api_call/async_calls.dart';
import 'package:the_dart_side/src/firestore/authentication/auth_screen.dart';
import 'package:the_dart_side/src/hackerclub/hackerClub.dart';
import 'package:the_dart_side/src/multiple_refresh/multiple_refresh.dart';

//import 'package:the_dart_side/src/animations2/implicitAnimations.dart';
//import 'package:the_dart_side/src/episode7/episode7_page.dart';
import 'package:the_dart_side/src/supernova/supernova_test.dart';

//import 'episode3/episode3_page.dart';
//import 'episode8/episode8_page.dart';

import 'package:the_dart_side/src/animations/main_animations.dart';
import 'package:the_dart_side/src/custom_appbar/episode3_page.dart';
import 'package:the_dart_side/src/multi_layout/episode8_page.dart';
import 'package:the_dart_side/src/responsive/episode7_page.dart';
import 'package:the_dart_side/src/ui_samples/curve_menu.dart';
import 'package:the_dart_side/src/wad/navigation_rail_example.dart';

import 'firestore/samples_firestore.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AlbumProvider()..getAlbums(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: MenuPage(),
      ),
    );
  }
}

class Cosa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cosa'),
      ),
      body: Container(),
    );
  }
}

class MenuPage extends StatelessWidget {
  void _openNewPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/images/dash_vader_white.png', height: 200),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text("Hola HackerClub"),
                  onPressed: () => _openNewPage(
                    context,
                    HackerClub(),
                  ),
                ),
                RaisedButton(
                  child: Text("Appbar Personalizada"),
                  onPressed: () => _openNewPage(context, Episode3Page()),
                ),
                RaisedButton(
                  child: Text("Responsive"),
                  onPressed: () => _openNewPage(context, Episode7Page()),
                ),
                RaisedButton(
                  child: Text("Episode VIII: Multilayout"),
                  onPressed: () => _openNewPage(context, Episode8Page()),
                ),
                RaisedButton(
                  child: Text("Animaciones Implicitas"),
                  onPressed: () => _openNewPage(context, ImplicitAnimations()),
                ),
                RaisedButton(
                  child: Text("Supernova"),
                  onPressed: () => _openNewPage(
                    context,
                    SupernovaTest(),
                  ),
                ),
                RaisedButton(
                  child: Text("Multilayout"),
                  onPressed: () => _openNewPage(
                    context,
                    Episode8Page(),
                  ),
                ),
                RaisedButton(
                  child: Text("Animations"),
                  onPressed: () => _openNewPage(
                    context,
                    MainAnimations(),
                  ),
                ),
                RaisedButton(
                  child: Text("API Call"),
                  onPressed: () => _openNewPage(
                    context,
                    AsyncCalls(),
                  ),
                ),
                RaisedButton(
                  child: Text("Curve Menu"),
                  onPressed: () => _openNewPage(
                    context,
                    CurveMenu(),
                  ),
                ),
                RaisedButton(
                  child: Text("Multiple Refesh"),
                  onPressed: () => _openNewPage(
                    context,
                    MultipleRefresh(),
                  ),
                ),
                RaisedButton(
                  child: Text("Firestore"),
                  onPressed: () => _openNewPage(
                    context,
                    SamplesFirestore(),
                  ),
                ),
                RaisedButton(
                  child: Text("Firebase Auth"),
                  onPressed: () => _openNewPage(
                    context,
                    AuthScreen(),
                  ),
                ),
                RaisedButton(
                  child: Text("Navigation Rail Example"),
                  onPressed: () => _openNewPage(
                    context,
                    NavigationRailExample(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
