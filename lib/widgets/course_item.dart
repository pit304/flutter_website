import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../data/course_data.dart';
import '../tools/technology_icons.dart';
import '../tools/links.dart';

class CourseItem extends StatefulWidget {
  final int index;

  CourseItem(this.index);

  @override
  _CourseItemState createState() => _CourseItemState();
}

class _CourseItemState extends State<CourseItem> {
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
    final course = COURSE_DATA.firstWhere((course) => course.id == currentIndex,
        orElse: () => null);
    if (course == null) {
      return Container();
    }
    return Column(children: <Widget>[
      Expanded(
        flex: 2,
        child: Center(
          child: GestureDetector(
            onTap: () {
              onOpen(course.url);
            },
            child: AutoSizeText(
              course.title,
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
                onOpen(course.url);
              },
              child: Icon(
                Icons.web,
                color: Colors.white,
              ),
            ),
            if (course.certificateUrl != null)
              GestureDetector(
                onTap: () {
                  onOpen(course.certificateUrl);
                },
                child: Icon(
                  MaterialCommunityIcons.certificate,
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
          children: getTechnologyIcons(course.technologies),
        ),
      ),
    ]);
  }
}
