import 'package:flutter/material.dart';
import 'package:flutter_storyboard/flutter_storyboard.dart';
import 'package:random_color/random_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Storyboard Example',
      theme: ThemeData.light().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.red,
      ),
      darkTheme: ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.light,
      home: StoryboardInApp(),
    );
  }
}

Widget _generateScreen({
  Text title,
  FloatingActionButton fab,
  Color color,
}) {
  return Builder(
    builder: (context) {
      final Map<String, dynamic> args =
          ModalRoute.of(context).settings.arguments;
      return Scaffold(
        appBar: AppBar(title: title),
        backgroundColor: color,
        body: args == null ? null : Center(child: Text(args.toString())),
        floatingActionButton: fab,
      );
    },
  );
}

class StoryboardInApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: StoryBoard(
                initialScale: 0.6,
                title: 'Screens',
                usePreferences: true,
                crossAxisCount: 7,
                showAppBar: true,
                children: [
                  for (var i = 0; i < 25; i++)
                    SizedBox.fromSize(
                      size: Size(400, 700),
                      child: _generateScreen(
                        title: Text('Screen$i'),
                        color: RandomColor(i).randomColor(),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Scaffold(
                backgroundColor: Colors.grey[800],
                appBar: AppBar(
                  backgroundColor: Colors.blue,
                  title: Text('Components'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
