import 'package:flutter/widgets.dart';

class Node extends StatefulWidget {
  const Node({
    Key? key,
    required this.global,
    this.local = const Offset(0, 0),
    required this.child,
  }) : super(key: key);

  final Offset global;
  final Offset local;
  final Widget child;

  @override
  State<Node> createState() => _NodeState();
}

class _NodeState extends State<Node> {
  late Offset _local = widget.local;
  Offset get pos => widget.global + _local;

  void updateLocalPosition(Offset delta) => setState(() => _local += delta);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: pos.dx,
      top: pos.dy,
      child: GestureDetector(
        onPanUpdate: ((details) => updateLocalPosition(details.delta)),
        child: Container(child: widget.child),
      ),
    );
  }
}
