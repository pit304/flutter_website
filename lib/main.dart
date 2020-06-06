import 'package:flutter/material.dart';

import './widgets/project_item.dart';
import './widgets/header_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Personal Website - Flutter', home: MainScreen());
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum: EdgeInsets.all(5),
        child: Center(
          child: Container(
            constraints: BoxConstraints(minWidth: 300, maxWidth: 800),
            //width: SizeConfig.screenWidth * 0.6,
            child: CustomScrollView(
              primary: true,
              slivers: <Widget>[
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return new ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: _randomColor(index),
                        height: 200.0,
                        child: Center(
                          child: HeaderItem(index),
                        ),
                      ),
                    );
                  }, childCount: 8),
                ),
                renderTitle('PROJECTS'),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return new ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: _randomColor(index + 8),
                        child: Center(
                          child: ProjectItem(index),
                        ),
                        height: 200.0),
                    );
                  }, childCount: 12),
                ),
                renderTitle('COURSES'),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return new ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                          color: _randomColor(index + 20), height: 200.0),
                    );
                  }, childCount: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _randomColor(int index) {
    switch (index % 9) {
      case 0:
        return Colors.orange;
      case 1:
        return Colors.teal;
      case 2:
        return Colors.pink;
      case 3:
        return Colors.blueGrey;
      case 4:
        return Colors.deepOrange;
      case 5:
        return Colors.grey.shade200;
      case 6:
        return Colors.amber;
      case 7:
        return Colors.blue.shade900;
      case 8:
        return Colors.indigo;
      default:
        return Colors.deepPurple;
    }
  }

  Widget renderTitle(String title) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 50.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Source Sans Pro',
            color: Colors.black,
            fontSize: 20.0,
            letterSpacing: 2.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
    );
  }
}
