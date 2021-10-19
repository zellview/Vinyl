import 'package:flutter/material.dart';
import 'package:vinyl/screens/blue_screen.dart';
import 'package:vinyl/screens/green_screen.dart';
import 'package:vinyl/screens/red_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'zellview vinyl',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigatorPage(),
    );
  }

  MyApp();
}

class NavigatorPage extends StatefulWidget {
  NavigatorPage({Key? key }) : super(key: key);

  //final String title;

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {

  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("zellview Vinyl"),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        children: [
          BlueScreen(),
          GreenScreen(),
          RedScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ice_skating), label: "blue" ),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: "green"),
          BottomNavigationBarItem(icon: Icon(Icons.accessibility_sharp), label: "red"),
        ],
        onTap: (newIndex){
          pageController.animateToPage(newIndex, duration: Duration(milliseconds: 400), curve: Curves.easeOutBack);
          setState(() {
            currentIndex= newIndex;
          });
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (null),
        tooltip: 'Scan',
        child: Icon(Icons.add),
      ),
    );
  }
}
