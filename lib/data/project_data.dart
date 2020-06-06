import '../models/technology.dart';
import '../models/project.dart';

const PROJECT_DATA = const [
  Project(1, 'MY SHOP', 'Flutter Shop', true, 'https://flutter-shop.petrencu.ro',
      'pit304/flutter_shop', [Technology.Flutter],
      completionDate: '2015-07-20'),
  Project(
      2,
      'MEALS',
      'Flutter Meals',
      true,
      'https://flutter-meals.petrencu.ro',
      'pit304/flutter_meals',
      [Technology.Flutter],
      completionDate: '2015-07-20'),
  Project(
      3,
      'GREAT PLACES',
      'Flutter Great Places',
      false,
      'https://flutter-great-places.petrencu.ro',
      'pit304/flutter_great_places',
      [Technology.Flutter]),
  Project(4, 'WEBSITE', 'Flutter Website', false, 'https://alex.petrencu.ro',
      'pit304/flutter_website', [Technology.Flutter]),
  Project(
      5,
      'EXHIBIT ADMIN',
      'Exhibit website admin',
      true,
      'https://exhibit-admin.petrencu.ro/admin',
      'pit304/exhibit_admin',
      [Technology.Python, Technology.Django],
      completionDate: '2015-07-20'),
  Project(6, 'EXHIBIT', 'Exhibit website', true, 'https://exhibit.petrencu.ro',
      'pit304/exhibit', [Technology.Angular, Technology.Ionic],
      completionDate: '2015-07-20'),
];
