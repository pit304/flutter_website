import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

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
        return Container();
    }
  }

  Future<void> _onOpen(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}
