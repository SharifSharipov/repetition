import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:repetition/src/config/routes/app_routes.dart';
import 'package:repetition/src/features/architekture_patterns_setstate/data/models/post_model/post_model.dart';
import 'package:repetition/src/features/architekture_patterns_setstate/domain/netowork/http_service.dart';

class ExampleTwoPage extends StatefulWidget {
  const ExampleTwoPage({super.key});

  @override
  State<ExampleTwoPage> createState() => _ExampleTwoPageState();
}

class _ExampleTwoPageState extends State<ExampleTwoPage> {
  bool isLoading = false;
  List<PostModel> items = [];
  void _apiPostList() async {
    setState(() {
      isLoading = true;
    });
    var response = await ApiServiceTwo.GET(ApiServiceTwo.API_LIST, ApiServiceTwo.paramsEmpty());
    setState(() {
      isLoading = false;
      if (response != null) {
        items = ApiServiceTwo.parsePostList(response);
      } else {
        items = [];
      }
    });
  }

  void _apiPostDelete(PostModel post) async {
    setState(() {
      isLoading = true;
    });
    var response = await ApiServiceTwo.DELETE(
        ApiServiceTwo.API_DELETE + post.id.toString(), ApiServiceTwo.paramsEmpty());
    setState(() {
      isLoading = false;
      if (response != null) {
        _apiPostList();
      } else {
        isLoading = false;
      }
    });
  }

  void _apiPostUpdate(PostModel post) async {
    setState(() {
      isLoading = true;
    });
    var response = await ApiServiceTwo.PUT(
        ApiServiceTwo.API_UPDATE + post.id.toString(), ApiServiceTwo.paramsEmpty());
    setState(() {
      isLoading = false;
      if (response != null) {
        _apiPostList();
      } else {
        isLoading = false;
      }
    });
  }

  void _apiPostCreate(PostModel post) async {
    setState(() {
      isLoading = true;
    });
    var response = await ApiServiceTwo.PUT(
        ApiServiceTwo.API_UPDATE + post.id.toString(), ApiServiceTwo.paramsEmpty());
    setState(() {
      isLoading = false;
      if (response != null) {
        _apiPostList();
      } else {
        isLoading = false;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Two"),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.architecturePatternsSetState);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return itemOfPost(items[index]);
            },
            itemCount: items.length,
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        focusColor: Colors.amberAccent,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget itemOfPost(PostModel post) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 10),
      child: Card(
        child: Slidable(
          key: Key(post.id.toString()), // Providing a unique key based on post ID
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(onDismissed: () {}),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  _apiPostUpdate(post);
                },
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Update',
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(onDismissed: () {}),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  _apiPostDelete(post);
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
            title: Text(post.title.toUpperCase()),
            subtitle: Text(post.body),
          ),
        ),
      ),
    );
  }
}
/*Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
        title: Text(item.title),
        subtitle: Text(item.body),
      ),
    );*/
/*Container(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      child: Column(
        children: [
          Text(item.title.toUpperCase()),
          Text(item.body.toUpperCase()),
        ],
      ),
    );*/
