import 'package:flutter/foundation.dart';

class Project {
  final String id;
  final String title;
  final String description;
  final bool completed;
  final String url;
  final String codeUrl;
  final DateTime completionDate;

  Project(
    this.id,
    this.title,
    this.description,
    this.completed,
    this.url,
    this.codeUrl,
    this.completionDate,
  );
}

class Projects with ChangeNotifier {
  List<Project> _projects = [];

  List<Project> get projects {
    return [..._projects];
  }

  Future<void> fetchAndSetProjects() async {
    _projects = await Future<List<Project>>.value([
      Project('1', "Shop", "Flutter Shop", true, "flutter-shop.petrencu.ro", "github.com/pit304/flutter_shop", DateTime.now()),
      Project('2', "Meals", "Flutter Meals", true, "flutter-shop.petrencu.ro", "github.com/pit304/flutter_meals", DateTime.now()),
      Project('3', "Great Places", "Flutter Great Places", true, "flutter-shop.petrencu.ro", "github.com/pit304/flutter_great_places", DateTime.now()),
      Project('4', "Website", "Flutter Meals", true, "alex.petrencu.ro", "github.com/pit304/flutter_website", DateTime.now())
    ]);
    notifyListeners();
  }

    Project findById(String id) {
    return _projects.firstWhere((project) => project.id == id);
  }
}
