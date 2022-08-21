import 'package:flutter/widgets.dart';
import 'package:topono/widgets/graph_bg.dart';

class Graph extends StatefulWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        GraphBackground(),
      ],
    );
  }
}
