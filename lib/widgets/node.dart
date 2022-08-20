import 'package:flutter/widgets.dart';
import 'package:topono/theme.dart';

class Node extends StatefulWidget {
  const Node({
    Key? key,
    required this.child,
    required this.top,
    required this.left,
  }) : super(key: key);

  final Widget child;
  final double top;
  final double left;

  @override
  State<Node> createState() => _NodeState();
}

class _NodeState extends State<Node> {
  Offset position = Offset(100, 100);

  void updatePosition(Offset newPosition) =>
      setState(() => position = newPosition);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        maxSimultaneousDrags: 1,
        feedback: widget.child,
        childWhenDragging: Opacity(
          opacity: .3,
          child: widget.child,
        ),
        onDragEnd: (details) => updatePosition(details.offset),
        child: Container(
          // decoration: BoxDecoration(color: theme['node']),
          child: widget.child,
        ),
      ),
    );
  }
}
