enum Technology { Angular, Ionic, Flutter, Python, Django }

class Project {
  final int id;
  final String title;
  final String description;
  final bool completed;
  final String url;
  final String codeUrl;
  final List<Technology> technologies;
  final String completionDate;

  const Project(
    this.id,
    this.title,
    this.description,
    this.completed,
    this.url,
    this.codeUrl, 
    this.technologies, {
    this.completionDate,
  });
}
