import './technology.dart';

class Course {
  final int id;
  final String title;
  final String description;
  final bool completed;
  final String url;
  final List<Technology> technologies;
  final String certificateUrl;
  final String completionDate;

  const Course(
    this.id,
    this.title,
    this.description,
    this.completed,
    this.url,
    this.technologies, {
    this.certificateUrl,
    this.completionDate,
  });
}
