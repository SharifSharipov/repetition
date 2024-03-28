import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:repetition/src/features/architecture_patterns_bloc/data/models/post_model.dart';
>>>>>>> 1cfaa5b (update page add)
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/pages/architecture_patterns_bloc.dart';
import 'package:repetition/src/features/architecture_patterns_bloc/presentation/pages/update_page.dart';
import 'package:repetition/src/features/architecture_patterns_provider/presentation/pages/architecture_patterns_provider.dart';
import 'package:repetition/src/features/architekture_patterns_getx/presentation/pages/architecture_patterns_getx.dart';
import 'package:repetition/src/features/architekture_patterns_getx/presentation/pages/architecture_patterns_getx_main.dart';
import 'package:repetition/src/features/architekture_patterns_getx/presentation/pages/splash_page.dart';
import 'package:repetition/src/features/architekture_patterns_getx/presentation/pages/starter_page.dart';
import 'package:repetition/src/features/architekture_patterns_setstate/presentation/pages/architekture_patterns_setstate.dart';
import 'package:repetition/src/features/architekture_patterns_setstate/presentation/pages/example_two.dart';
import 'package:repetition/src/features/arrchitecture_patterns_unit_widget_tests/presentation/pages/architekture_patterns_unit_widget_tests.dart';
import 'package:repetition/src/features/navigate_screen%20/navigate_screen.dart';

import '../../features/architecture_patterns_bloc/presentation/pages/create_pages.dart';

class RouteNames {
  static const String architecturePatternsBloc = "/";
  static const String architecturePatternsProvider = "/architecture_patterns_provider";
  static const String architecturePatternsGetX = "/architecture_patterns_get_x";
  static const String architecturePatternsSetState = '/architecture_patterns_set_state';
  static const String architecturePatternsUnitWidgetTests =
      '/architecture_patterns_unit_widget_tests';
  static const String navigateScreen = '/navigate_screen';
  static const String exampleTwo = '/example_two';
<<<<<<< HEAD
  static const String architecturePatternsMain="/architecture_patterns_main";
  static const String splashPage="/splash_page";
  static const String starterPage="/starter_page";
  static const String createPage="create_page";
  static const String updatePage="update_page";
}

=======
  static const String architecturePatternsMain = "/architecture_patterns_main";
  static const String splashPage = "/splash_page";
  static const String starterPage = "/starter_page";
  static const String createPage = "create_page";
  static const String updatePage = "update_page";
}
PostModel post=PostModel(id: 1, title: '', body: '', userId: 1);
PostModel updatePost=post.copyWith();
>>>>>>> 1cfaa5b (update page add)
class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.architecturePatternsBloc:
        return MaterialPageRoute(builder: (context) => ArchitecturePatternsBloc());
      case RouteNames.architecturePatternsProvider:
        return MaterialPageRoute(builder: (context) {
<<<<<<< HEAD
          return  const ArchitectureProvider();
=======
          return const ArchitectureProvider();
>>>>>>> 1cfaa5b (update page add)
        });
      case RouteNames.architecturePatternsGetX:
        return MaterialPageRoute(builder: (context) {
          return const ArchitecturePatternsGetX();
        });
      case RouteNames.architecturePatternsSetState:
        return MaterialPageRoute(builder: (context) {
<<<<<<< HEAD
          return const  ArchitecturePatternsSetState();
=======
          return const ArchitecturePatternsSetState();
>>>>>>> 1cfaa5b (update page add)
        });
      case RouteNames.architecturePatternsUnitWidgetTests:
        return MaterialPageRoute(builder: (context) {
          return const ArchitecturePatternsUnitWidgetTests();
        });
      case RouteNames.navigateScreen:
        return MaterialPageRoute(builder: (context) {
          return const NavigateScreen();
        });
      case RouteNames.exampleTwo:
        return MaterialPageRoute(builder: (context) {
          return const ExampleTwoPage();
        });
      case RouteNames.architecturePatternsMain:
        return MaterialPageRoute(builder: (context) {
          return const ArchitecturePatternsMain();
        });
      case RouteNames.splashPage:
        return MaterialPageRoute(builder: (context) {
          return const SplashPage();
        });
      case RouteNames.starterPage:
        return MaterialPageRoute(builder: (context) {
          return const StarterPage();
        });
      case RouteNames.createPage:
        return MaterialPageRoute(builder: (context) {
          return const CreatePage();
        });
      case RouteNames.updatePage:
        return MaterialPageRoute(builder: (context) {
<<<<<<< HEAD
          return const UpdatePage();
=======
          return UpdatePage(
            postModel: updatePost,
          );
>>>>>>> 1cfaa5b (update page add)
        });
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Маршрут недоступен"),
            ),
          ),
        );
    }
  }
}
