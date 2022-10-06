import 'package:flutter/material.dart';

import 'basic_example_page.dart';

void main() => runApp(MyApp());

class RouteNames {
  static const String root="/";
  static const String simple="/simple";
  static const String youtube="/youtube";
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrollable Timeline Demo',
      initialRoute: RouteNames.root,
      routes: {
        RouteNames.root: (context) => MainScreen(),
        RouteNames.simple: (context) => BasicExamplePage(),
        RouteNames.youtube: (context) => BasicExamplePage(),
      },
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  final ButtonStyle btnStyle =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),backgroundColor: Colors.green);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("ScrollableTimeline example")),
        body: Center(
      child: Column(
        children: [
          ElevatedButton(
              style: btnStyle,
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.simple);
              },
              child: Text("simple example")),
          ElevatedButton(
              style: btnStyle,
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.youtube);
              },
              child: Text("youtube example")),
        ],
      ),
    ));
  }
}
