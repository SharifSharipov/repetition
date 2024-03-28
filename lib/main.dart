import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/manager/create_post_cubit/create_post_cubit.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/manager/update_post_cubit/update_post_cubit.dart';
import 'src/config/routes/app_routes.dart';
import 'src/features/architecture_patterns_bloc/presentation/manager/cantroller/cubit.dart';
import 'src/features/architekture_patterns_getx/domain/service/di_service.dart';

void main() async{
  await DiService.init();
  runApp(const App());
}
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => ListPostCubit()),
      BlocProvider(create: (context)=>CreatePostCubit()),
      BlocProvider(create: (context)=>UpdatePostCubit()),
    ], child: const MyApp());
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: RouteNames.updatePage,
    );
  }
}

/* return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: RouteNames.navigateScreen,
    );

    return  GetMaterialApp(
     home:const ArchitecturePatternsMain(),
     initialBinding: BindingService(),
     getPages: [
       GetPage(
         name:ArchitecturePatternsMain.id,
         page: () => const ArchitecturePatternsMain(),
         binding:  BindingService(),
       ),
     ],
   );*/