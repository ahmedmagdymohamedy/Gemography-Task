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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Hero(
                  tag: widget.repository.id,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.repository.avatarURL),
                    radius: 60,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  widget.repository.ownerName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.repository.description,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star),
                    SizedBox(width: 2),
                    Text(widget.repository.numberOfStars),
                  ],
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () async {
                    print(widget.repository.htmlUrl);
                    await launch(widget.repository.htmlUrl);
                  },
                  child: Text('Open Repository on web'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
