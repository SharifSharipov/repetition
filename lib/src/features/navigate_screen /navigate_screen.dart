import 'package:flutter/material.dart';
import 'package:repetition/src/features/navigate_screen%20/widgets/navigate_widget.dart';
import '../../config/routes/app_routes.dart';
class NavigateScreen extends StatefulWidget {
  const NavigateScreen({super.key});

  @override
  State<NavigateScreen> createState() => _NavigateScreenState();
}

class _NavigateScreenState extends State<NavigateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade400,
          automaticallyImplyLeading: false,
          title: const Text('Navigate Screen'),
          centerTitle: true ,
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                NavigateWidget(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.architecturePatternsSetState);
                  },
                  text: 'Architecture Patterns SetState',
                ),
                NavigateWidget(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.architecturePatternsProvider);
                  },
                  text: 'Architecture Patterns Provider',
                ),
                NavigateWidget(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.architecturePatternsGetX);
                  },
                  text: 'Architecture Patterns Get X',
                ),
                NavigateWidget(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.architecturePatternsMain);
                  },
                  text: 'Architecture Patterns Starter Get X',
                ),
                NavigateWidget(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.starterPage);
                  },
                  text: 'Architecture Patterns Main',
                ),
                NavigateWidget(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.architecturePatternsBloc);
                  },
                  text: 'Architecture Patterns Bloc',
                ),
                NavigateWidget(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.architecturePatternsUnitWidgetTests);
                  },
                  text: 'Architecture Patterns Unit Test',
                ),
                NavigateWidget(
                  onTap: () {
                    //Navigator.pushNamed(context, RouteNames.architecturePatternsUnitWidgetTests);
                  },
                  text: 'Notification Center',
                ),
                NavigateWidget(
                  onTap: () {
                    //Navigator.pushNamed(context, RouteNames.architecturePatternsUnitWidgetTests);
                  },
                  text: 'Yandex Map',
                ),
                NavigateWidget(
                  onTap: () {
                    //Navigator.pushNamed(context, RouteNames.architecturePatternsUnitWidgetTests);
                  },
                  text: 'Music player',
                ),
                NavigateWidget(
                  onTap: () {
                    //Navigator.pushNamed(context, RouteNames.architecturePatternsUnitWidgetTests);
                  },
                  text: 'Dynamic Web view',
                ),
                NavigateWidget(
                  onTap: () {
                    //Navigator.pushNamed(context, RouteNames.architecturePatternsUnitWidgetTests);
                  },
                  text: 'Rx Dart',
                ),
                NavigateWidget(
                  onTap: () {
                    //Navigator.pushNamed(context, RouteNames.architecturePatternsUnitWidgetTests);
                  },
                  text: 'Bio metrics auth',
                ),
                NavigateWidget(
                  onTap: () {
                    //Navigator.pushNamed(context, RouteNames.architecturePatternsUnitWidgetTests);
                  },
                  text: 'Fire base',
                ),
              ],
            ))
          ],
        ));
  }
}
