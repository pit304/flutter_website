import '../models/technology.dart';
import '../models/course.dart';

const COURSE_DATA = const [
  Course(
      1,
      'FLUTTER & DART',
      'Flutter & Dart - The Complete Guide',
      true,
      'https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps',
      [Technology.Flutter],
      certificateUrl: 'https://www.udemy.com/certificate/UC-9ab16315-5379-463c-93a3-06b942b60472',
      completionDate: '2015-07-20'),
  Course(
      2,
      'DOCKER MASTERY',
      'Docker Mastery: with Kubernetes +Swarm from a Docker Captain',
      false,
      'https://www.udemy.com/course/docker-mastery',
      [Technology.Docker]),
  Course(
      3,
      'IONIC 5',
      'Ionic 5 - Build iOS, Android & Web Apps with Ionic & Angular',
      true,
      'https://www.udemy.com/course/ionic-2-the-practical-guide-to-building-ios-android-apps',
      [Technology.Angular, Technology.Ionic],
      certificateUrl: 'https://www.udemy.com/certificate/UC-f8d366c2-cecc-44a1-8bf2-f7fd498c216a',
      completionDate: '2015-07-20'),
  Course(
      4,
      'DART AND FLUTTER',
      'Dart and Flutter: The Complete Developer\'s Guide',
      false,
      'https://www.udemy.com/course/dart-and-flutter-the-complete-developers-guide',
      [Technology.Flutter]),
];
