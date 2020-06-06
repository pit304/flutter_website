import 'package:flutter/foundation.dart';

import '../data/project_data.dart';
import '../models/project.dart';

class Projects with ChangeNotifier {
  List<Project> _projects = [];

  List<Project> get projects {
    return [..._projects];
  }

  Future<void> fetchAndSetProjects() async {
    _projects = await Future<List<Project>>.value(PROJECT_DATA);
    notifyListeners();
  }

  Project findById(String id) {
    return _projects.firstWhere((project) => '$project.id' == id);
  }
}
