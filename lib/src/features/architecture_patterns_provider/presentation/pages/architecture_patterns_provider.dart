import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repetition/src/config/routes/app_routes.dart';
import 'package:repetition/src/features/architecture_patterns_provider/data/models/post_model/post_mopel.dart';
import 'package:repetition/src/features/architecture_patterns_provider/presentation/manager/home_view_model/home_view_model.dart';
import 'package:repetition/src/features/architecture_patterns_provider/presentation/widgets/item_of_view_model.dart';

class ArchitectureProvider extends StatefulWidget {
  const ArchitectureProvider({super.key});

  @override
  State<ArchitectureProvider> createState() => _ArchitectureProviderState();
}

class _ArchitectureProviderState extends State<ArchitectureProvider> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    super.initState();
    homeViewModel.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Architecture Provider"),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.navigateScreen);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            return Stack(
              children: [
                ListView.builder(
                  itemBuilder: (context, index) {
                    PostModel post = homeViewModel.postList[index];
                    return itemOfPost(homeViewModel, post);
                  },
                  itemCount: homeViewModel.postList.length,
                ),
                homeViewModel.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        focusColor: Colors.amberAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
