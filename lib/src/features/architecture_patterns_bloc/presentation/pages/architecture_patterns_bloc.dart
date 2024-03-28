import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repetition/src/config/routes/app_routes.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/manager/create_post_cubit/create_post_cubit.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/pages/create_pages.dart';
import '../manager/cantroller/cubit.dart';
import '../manager/cantroller/state.dart';
import '../widgets/item_of_state.dart';

class ArchitecturePatternsBloc extends StatefulWidget {
  const ArchitecturePatternsBloc({Key? key}) : super(key: key);

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
    double width = MediaQuery
        .of(context)
        .size
        .width;
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