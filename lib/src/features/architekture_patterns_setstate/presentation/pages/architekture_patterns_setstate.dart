import 'package:flutter/material.dart';
import 'package:repetition/src/config/routes/app_routes.dart';
import 'package:repetition/src/features/architekture_patterns_setstate/data/models/my_github_model/my_github_model.dart';
import 'package:repetition/src/features/architekture_patterns_setstate/domain/netowork/apiservice.dart';

import '../../data/models/universal_data/universal_data.dart';

class ArchitecturePatternsSetState extends StatefulWidget {
  const ArchitecturePatternsSetState({super.key});

  @override
  State<ArchitecturePatternsSetState> createState() => _ArchitecturePatternsSetStateState();
}

class _ArchitecturePatternsSetStateState extends State<ArchitecturePatternsSetState> {
  late Future<UniversalData> _myGithubDataFuture;
  final _apiService = ApiService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchMyGithubData();
  }

  Future<void> _fetchMyGithubData() async {
    setState(() {
      _myGithubDataFuture = _apiService.getMyGithubData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.navigateScreen);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Architecture Patterns SetState"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.exampleTwo);
            },
            child: const Text(
              "Next",
            ),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<UniversalData>(
          future: _myGithubDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final myGitHubData = snapshot.data!.data as MyGithub;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Name: ${myGitHubData.name}'),
                    Text('Login: ${myGitHubData.login}'),
                    Text('AvatarUrl: ${myGitHubData.avatarUrl}'),
                    Text('Url: ${myGitHubData.url}'),
                    Text("Status Code: ${snapshot.data!.statusCode}"),
                    Text("Html Url: ${myGitHubData.htmlUrl}"),
                    Text("Followers Url: ${myGitHubData.followersUrl}"),
                    Text("Following Url: ${myGitHubData.followingUrl}"),
                    Text("Type:${myGitHubData.type}"),
                    Text("Company:${myGitHubData.company}"),
                    Text("Email:${myGitHubData.email}"),
                    Text("Bio:${myGitHubData.bio}"),
                    Text("Location:${myGitHubData.location}"),
                    Text("Public Repository:${myGitHubData.publicRepos}"),
                    Text("Public Gists:${myGitHubData.publicGists}"),
                    Text("Twitter username:${myGitHubData.twitterUsername}"),
                    Text("Site Admin:${myGitHubData.siteAdmin}"),
                    Text("Blog:${myGitHubData.blog}"),
                    Text("Followers:${myGitHubData.followers}"),
                    Text("Following:${myGitHubData.following}"),
                    Text("Created At:${myGitHubData.createdAt}"),
                    Text("Updated At:${myGitHubData.updatedAt}"),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
