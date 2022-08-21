import 'package:flutter/widgets.dart';
import 'package:topono/widgets/graph_bg.dart';
import 'package:topono/widgets/panel.dart';

class Graph extends StatefulWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  Offset _global = const Offset(0, 0);

  void updateGlobal(Offset delta) => setState(() => _global += delta);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onPanUpdate: ((details) => updateGlobal(details.delta)),
          child: GraphBackground(offset: _global),
        ),
        Panel(
          global: _global,
          title: "Panel",
          description: "Description",
        ),
      ],
    );
  }
}
