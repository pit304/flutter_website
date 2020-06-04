import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import './screens/project_list_screen.dart';
import 'providers/projects.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
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
                  return new Container(
                    color: _randomColor(index),
                    height: 200.0,
                    child: Center(
                      child: getTopContainerWidget(index),
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
                  return new Container(
                      color: _randomColor(index + 8), height: 200.0);
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
                  return new Container(
                      color: _randomColor(index + 20), height: 200.0);
                }, childCount: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }

  Widget getTopContainerWidget(int index) {
    switch (index) {
      case 1:
        return Text(
          'Alex Petrencu',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 40.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
      case 3:
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                MaterialCommunityIcons.linkedin,
                color: Colors.white,
              ),
              Linkify(
                linkStyle: TextStyle(color: Colors.white),
                onOpen: _onOpen,
                text: "https://linkedin.com/in/alexandru-petrencu",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                ),
              ),
            ]);
      case 4:
        return Text(
          'SOFTWARE ENGINEER',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Source Sans Pro',
            color: Colors.white,
            fontSize: 20.0,
            letterSpacing: 2.5,
            fontWeight: FontWeight.bold,
          ),
        );
      case 5:
        return Container(
          color: Colors.grey.shade200,
          padding: EdgeInsets.all(10),
          child: Image.asset('images/alex.png',),
        );
      case 6:
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.email,
                color: Colors.white,
              ),
              Linkify(
                linkStyle: TextStyle(color: Colors.white),
                onOpen: _onOpen,
                text: 'alex.petrencu@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro'),
              ),
            ]);
      default:
        return null;
    }
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
        return Colors.grey;
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
