import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/projects.dart';

class ProjectItem extends StatefulWidget {
  final Project project;

  ProjectItem(this.project);

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _expanded ? 202 : 95,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(widget.project.title),
              subtitle: Text(
                  DateFormat('dd/MM/yyyy HH:mm').format(widget.project.completionDate)),
              trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: _expanded ? 110 : 0,
              child: ListView(
                children: <Widget>[
                            Text(widget.project.description,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '${widget.project.completed} ${widget.project.completionDate}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                ),
              ),
            );
  }
}
