import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gemography_task/models/Constants.dart';
import 'package:gemography_task/models/Models.dart';
import 'package:gemography_task/screens/home%20page%20screen/trending/RepoCard.dart';
import 'package:http/http.dart' as http;

// i make lessWidget of the screen to keep th screen on when user go to setting screen and back again
class TerindingLess extends StatelessWidget {
  const TerindingLess({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Trending();
  }
}

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending>
    with AutomaticKeepAliveClientMixin {
  List<Repository> repositorys = [];
  ScrollController _scrollController = ScrollController();
  int reposPage = 0;

  bool loadingFaild = false;

  @override
  void initState() {
    fetchRepositorys(getNexRepoPageIndex());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // the user on the End of scroll Page
        fetchRepositorys(getNexRepoPageIndex());
      }
    });
    super.initState();
  }

  int getNexRepoPageIndex() {
    reposPage++;
    return reposPage;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return repositorys.length != 0
        ? ListView.builder(
            controller: _scrollController,
            itemCount: repositorys.length,
            itemBuilder: (ctx, index) =>
                RepoCard(repository: repositorys[index]),
          )
        :

        // loading data ...
        Center(
            child: !loadingFaild
                ? CircularProgressIndicator()
                : Text('Loadinig Faild (may be you not have internet)'),
          );
  }

  void fetchRepositorys(int numberOfPage) async {
    // now = to get yesterday
    DateTime now = DateTime.now().subtract(Duration(days: 1));
    String url =
        'https://api.github.com/search/repositories?q=created:>${now.year}-${formatNumber(now.month)}-${formatNumber(now.day)}&sort=stars&order=desc&page=${numberOfPage}';
    var uri = Uri.parse(url);
    try {
      var httpRes = await http.get(uri);
      if (httpRes.statusCode == 200) {
        //loding succes
        print('loading succes');
        Map data = jsonDecode(httpRes.body);
        setData(data);
      } else {
        //loding faild
        print('loading faild');
        setState(() {
          loadingFaild = true;
        });
      }
    } catch (e) {
      print('loading faild --- $e');
      setState(() {
        loadingFaild = true;
      });
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
        htmlUrl: repositoryMapData['html_url'],
      );
      setState(() {
        repositorys.add(repository);
      });
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
