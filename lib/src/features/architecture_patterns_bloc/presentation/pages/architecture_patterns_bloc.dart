import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repetition/src/config/routes/app_routes.dart';
<<<<<<< HEAD
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/manager/create_post_cubit/create_post_cubit.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/pages/create_pages.dart';
import '../manager/cantroller/cubit.dart';
import '../manager/cantroller/state.dart';
import '../widgets/item_of_state.dart';

class ArchitecturePatternsBloc extends StatefulWidget {
  const ArchitecturePatternsBloc({Key? key}) : super(key: key);
=======
import 'package:repetition/src/features/architecture_patterns_bloc/data/models/post_model.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/manager/create_post_cubit/create_post_cubit.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/pages/create_pages.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/widgets/view_of_home.dart';
import '../manager/cantroller/list_post_cubit.dart';
import '../manager/cantroller/list_post_state.dart';
import '../widgets/item_of_state.dart';

class ArchitecturePatternsBloc extends StatefulWidget {
  PostModel? postModel;
  ArchitecturePatternsBloc({Key? key,this.postModel}) : super(key: key);
>>>>>>> 1cfaa5b (update page add)

  @override
  State<ArchitecturePatternsBloc> createState() => _ArchitecturePatternsBlocState();
}

class _ArchitecturePatternsBlocState extends State<ArchitecturePatternsBloc> {
  @override
  void initState() {
    BlocProvider.of<ListPostCubit>(context).apiPostList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    double width = MediaQuery
        .of(context)
        .size
        .width;
=======
    List<PostModel> items = [];
    TextEditingController titleController = TextEditingController();
    TextEditingController bodyController = TextEditingController();
    @override
    void initState() {
      super.initState();
      titleController.text = widget.postModel!.title;
      bodyController.text = widget.postModel!.body;
    }
    double width = MediaQuery.of(context).size.width;
>>>>>>> 1cfaa5b (update page add)
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.navigateScreen);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text("Architecture Patterns Bloc"),
      ),
      body: BlocBuilder<ListPostCubit, ListPostState>(
        builder: (context, state) {
          if (state is ListPostLoading) {
<<<<<<< HEAD
            return viewPostLoading();
            ;
          } else if (state is ListPostLoaded) {
            var items = state.postList;
            return viewPostLoaded(items); // <- Added closing parenthesis here
          } else {
            return viewPostError(error: "Error---->>>");
          }
          // Handle other states if needed
          return Container();
        },
      ),
      floatingActionButton: Container(
        height: width / 5.7,
        width: width / 3.47,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.red,
              width: 2,
            )),
        child: TextButton(
          onPressed: () {
            BlocProvider.of<CreatePostCubit>(context).callCreatePage(context);
           // callCreatePage();
          },
          child: const Text(
            "Create",
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ),
      ),
    );
  }

  void callCreatePage() async {
  var result =  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreatePage()));
    if(result!=null){
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }
}
=======
            return viewOfHome([], true); // Pass empty list and loading state
          } else if (state is ListPostLoaded) {
            return viewOfHome(state.postList, false); // Pass the list of posts from the state
          } else if (state is ListPostError) {
            return viewOfHome(items, false); //
          }
          return viewOfHome(items, true);
        },
      ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          BlocProvider.of<CreatePostCubit>(context).callCreatePage(context);},
          child: const Icon(Icons.add),)
    );
  }
}
>>>>>>> 1cfaa5b (update page add)
