import 'dart:html';

import 'package:flutter/material.dart';
import 'package:topono/theme.dart';
import 'package:topono/widgets/node.dart';

class Graph extends StatefulWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    return BackgroundGrid(
      children: [
        Node(
          top: 0,
          left: 0,
          child: Placeholder(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

class BackgroundGrid extends StatefulWidget {
  const BackgroundGrid({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  State<BackgroundGrid> createState() => _BackgroundGridState();
}

class _BackgroundGridState extends State<BackgroundGrid> {
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      constrained: false,
      maxScale: double.infinity,
      minScale: double.minPositive,
      child: Container(
        width: 5000,
        height: 5000,
        decoration: BoxDecoration(
          color: theme['body-bg'],
          image: const DecorationImage(
            image: AssetImage('assets/grid_bg.png'),
            alignment: Alignment.topLeft,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Stack(children: widget.children),
      ),
    );
  }
}
