import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../tools/links.dart';

class HeaderItem extends StatefulWidget {
  final int index;

  HeaderItem(this.index);

  @override
  _HeaderItemState createState() => _HeaderItemState();
}

class _HeaderItemState extends State<HeaderItem> {
  @override
  Widget build(BuildContext context) {
    switch (widget.index) {
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
        return GestureDetector(
          onTap: () {
            onOpen('https://linkedin.com/in/alexandru-petrencu');
          },
          child: Tooltip(
            message: 'linkedin.com/in/alexandru-petrencu',
            child: Icon(
              MaterialCommunityIcons.linkedin,
              color: Colors.white,
              size: 40,
            ),
          ),
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
            'assets/images/alex.png',
          ),
        );
      case 6:
        return GestureDetector(
          onTap: () {
            onOpen('mailto:alex@petrencu.com');
          },
          child: Tooltip(
            message: "alex@petrencu.com",
            child: Icon(
              Icons.email,
              color: Colors.white,
              size: 40,
            ),
          ),
        );
      case 7:
        return GestureDetector(
          onTap: () {
            onOpen(
                'https://drive.google.com/file/d/1KZGFn2XdFfqZBwFZL925Z62XIiSzp8dV/view');
          },
          child: Tooltip(
            message: "Resume",
            child: Icon(
              MaterialCommunityIcons.file_account,
              size: 40,
              color: Colors.white,
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
