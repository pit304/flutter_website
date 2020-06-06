import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_website/models/project.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/project_data.dart';

class ProjectItem extends StatefulWidget {
  final int index;

  ProjectItem(this.index);

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  @override
  Widget build(BuildContext context) {
    int row = widget.index ~/ 4;
    int column = widget.index % 4;
    int currentIndex;
    if (row % 2 == 0 && column % 2 == 0) {
      currentIndex = row * 2 + column ~/ 2 + 1;
    } else if (row % 2 == 1 && column % 2 == 1) {
      currentIndex = row * 2 + column ~/ 2 + 1;
    }
    final project = PROJECT_DATA.firstWhere(
        (project) => project.id == currentIndex,
        orElse: () => null);
    if (project == null) {
      return Container();
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              _onOpen(project.url);
            },
            child: AutoSizeText(
              project.title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                //decoration: TextDecoration.underline,
                fontFamily: 'Source Sans Pro',
                color: Colors.white,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new GestureDetector(
                onTap: () {
                  _onOpen(project.url);
                },
                child: Icon(
                  Icons.web,
                  color: Colors.white,
                ),
              ),
              new GestureDetector(
                onTap: () {
                  _onOpen('https://github.com/' + project.codeUrl);
                },
                child: Icon(
                  MaterialCommunityIcons.git,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: getTechnologyIcons(project.technologies),
          ),
        ]);
  }

  Future<void> _onOpen(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }

  List getTechnologyIcons(List<Technology> technologies) {
    return technologies.map((technology) {
      switch (technology) {
        case Technology.Flutter:
          return FlutterLogo();
        case Technology.Angular:
          return Icon(MaterialCommunityIcons.angular, color: Colors.red);
        case Technology.Ionic:
          return Icon(Ionicons.logo_ionic, color: Colors.blue);
        case Technology.Django:
          return Icon(MaterialCommunityIcons.language_python);
        case Technology.Python:
          return Icon(MaterialCommunityIcons.language_python);
        default:
          return FlutterLogo();
      }
    }).toList();
  }
}
