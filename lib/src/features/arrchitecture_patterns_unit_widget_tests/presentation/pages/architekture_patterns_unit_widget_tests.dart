import "package:flutter/material.dart";
class ArchitecturePatternsUnitWidgetTests extends StatefulWidget {
  const ArchitecturePatternsUnitWidgetTests({super.key});

  @override
  State<ArchitecturePatternsUnitWidgetTests> createState() => _ArchitecturePatternsUnitWidgetTestsState();
}

class _ArchitecturePatternsUnitWidgetTestsState extends State<ArchitecturePatternsUnitWidgetTests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Architecture Patterns GetX"),
      ),
    );
  }
}
