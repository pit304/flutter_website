import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/technology.dart';

List getTechnologyIcons(List<Technology> technologies) {
  return technologies.map((technology) {
    switch (technology) {
      case Technology.Flutter:
        return Tooltip(message: "Flutter", child: FlutterLogo());
      case Technology.Angular:
        return Tooltip(
            message: "Angular",
            child: Icon(MaterialCommunityIcons.angular, color: Colors.red));
      case Technology.Ionic:
        return Tooltip(
            message: "Ionic",
            child: Icon(Ionicons.logo_ionic, color: Colors.blue));
      case Technology.Django:
        return Tooltip(
            message: "Django",
            child: SvgPicture.asset(
              'assets/images/django.svg',
              semanticsLabel: 'Django logo',
              height: 20,
            ));
      case Technology.Python:
        return Tooltip(
            message: "Python",
            child: SvgPicture.asset(
              'assets/images/python.svg',
              semanticsLabel: 'Python logo',
              height: 20,
            ));
      case Technology.Docker:
        return Tooltip(
            message: "Docker",
            child: Icon(MaterialCommunityIcons.docker, color: Colors.blue));
      default:
        return FlutterLogo();
    }
  }).toList();
}
