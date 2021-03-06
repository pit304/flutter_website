import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../data/project_data.dart';
import '../tools/technology_icons.dart';
import '../tools/links.dart';

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
    return Column(children: <Widget>[
      Expanded(
        flex: 2,
        child: Center(
          child: GestureDetector(
            onTap: () {
              onOpen(project.url);
            },
            child: AutoSizeText(
              project.title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                //decoration: TextDecoration.underline,
                fontSize: 20,
                fontFamily: 'Source Sans Pro',
                color: Colors.white,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                onOpen(project.url);
              },
              child: Icon(
                Icons.web,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () {
                onOpen('https://github.com/' + project.codeUrl);
              },
              child: Icon(
                MaterialCommunityIcons.git,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: getTechnologyIcons(project.technologies),
        ),
      ),
    ]);
  }

}
