import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gemography_task/models/Constants.dart';
import 'package:gemography_task/models/Models.dart';
import 'package:gemography_task/screens/home%20page%20screen/trending/RepoCard.dart';
import 'package:http/http.dart' as http;

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  List<Repository> repositorys = [];

  @override
  void initState() {
    fetchRepositorys(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return repositorys.length != 0
        ? ListView.builder(
            itemCount: repositorys.length,
            itemBuilder: (ctx, index) =>
                RepoCard(repository: repositorys[index]),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  void fetchRepositorys(int numberOfPage) async {
    // now = to get yesterday
    DateTime now = DateTime.now().subtract(Duration(days: 1));
    String url =
        'https://api.github.com/search/repositories?q=created:>${now.year}-${formatNumber(now.month)}-${formatNumber(now.day)}&sort=stars&order=desc&page=${numberOfPage}';
    var uri = Uri.parse(url);
    var httpRes = await http.get(uri);
    if (httpRes.statusCode == 200) {
      //loding succes
      print('loading succes');
      Map data = jsonDecode(httpRes.body);
      setData(data);
    } else {
      //loding faild
      throw Exception();
    }
  }

  void setData(Map data) async {
    List<dynamic> repositorysMapData = data['items'];

    for (int i = 0; i < repositorysMapData.length; i++) {
      Map repositoryMapData = repositorysMapData[i];
      // create new Repository
      Repository repository = Repository(
        id: repositoryMapData['id'],
        name: repositoryMapData['name'],
        description: repositoryMapData['description'] != null
            ? repositoryMapData['description']
            : 'no description',
        numberOfStars: repositoryMapData['stargazers_count'].toString(),
        ownerName: repositoryMapData['owner']['login'],
        avatarURL: repositoryMapData['owner']['avatar_url'],
      );
      setState(() {
        repositorys.add(repository);
      });
    }
  }
}
