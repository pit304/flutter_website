import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/projects.dart';
import '../widgets/project_item.dart';

class ProjectListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            Provider.of<Projects>(context, listen: false).fetchAndSetProjects(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (dataSnapshot.error != null) {
            // .. error handling
            return Center(
              child: Text('An error occured!'),
            );
          } else {
            return Consumer<Projects>(
              child: Center(
                child: Text('Got no projects yet, start adding some!'),
              ),
              builder: (ctx, projectData, child) => Expanded(
                child: ListView.builder(
                  itemCount: projectData.projects.length,
                  itemBuilder: (ctx, index) =>
                      ProjectItem(index),
                ),
              ),
            );
          }
        });
  }
}
