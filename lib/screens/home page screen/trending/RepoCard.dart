import 'package:flutter/material.dart';
import 'package:gemography_task/models/Models.dart';
import 'package:gemography_task/screens/repo%20detals/RepoDetails.dart';

class RepoCard extends StatelessWidget {
  Repository repository;

  RepoCard({required this.repository});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => RepoDetails(repository: repository)));
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              repository.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              repository.description,
              style: TextStyle(
                // fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Image.network(
                  repository.avatarURL,
                  width: 24,
                ),
                SizedBox(width: 8),
                Text(repository.ownerName),
                Spacer(),
                Icon(Icons.star),
                SizedBox(width: 2),
                Text(repository.numberOfStars),
              ],
            )
          ],
        ),
      ),
    );
  }
}
