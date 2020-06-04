import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_website/widgets/size_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
    SizeConfig().init(context);
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
                          child: getTopContainerWidget(index),
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
                          color: _randomColor(index + 8), height: 200.0),
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

  Widget getTopContainerWidget(int index) {
    switch (index) {
      case 1:
        return AutoSizeText(
          'Alex Petrencu',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 40.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
      case 3:
        return new GestureDetector(
          onTap: () {
            _onOpen('https://linkedin.com/in/alexandru-petrencu');
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  MaterialCommunityIcons.linkedin,
                  color: Colors.white,
                ),
                AutoSizeText(
                  'linkedin.com/in/alexandru-petrencu',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20,
                  ),
                ),
              ]),
        );
      case 4:
        return AutoSizeText(
          'SOFTWARE ENGINEER',
          maxLines: 2,
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
        return ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            'images/alex.png',
          ),
        );
      case 6:
        return GestureDetector(
          onTap: () {
            _onOpen('mailto:alex.petrencu@gmail.com');
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.email,
                color: Colors.white,
              ),
              AutoSizeText(
                'alex.petrencu@gmail.com',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Source Sans Pro'),
              ),
            ]),);
      default:
        return null;
    }
  }

  Future<void> _onOpen(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
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
