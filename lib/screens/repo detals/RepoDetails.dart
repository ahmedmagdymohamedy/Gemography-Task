import 'package:flutter/material.dart';
import 'package:gemography_task/models/Models.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoDetails extends StatefulWidget {
  Repository repository;

  RepoDetails({required this.repository});

  @override
  _RepoDetailsState createState() => _RepoDetailsState();
}

class _RepoDetailsState extends State<RepoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.repository.name),
      ),
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () async {
              print(widget.repository.htmlUrl);
              await launch(widget.repository.htmlUrl);
            },
            child: Text('Open Repository on web'),
          ),
        ),
      ),
    );
  }
}
