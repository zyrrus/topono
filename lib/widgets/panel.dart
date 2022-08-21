import 'package:flutter/widgets.dart';
import 'package:topono/theme.dart';
import 'package:topono/widgets/node.dart';

class Panel extends StatelessWidget {
  const Panel({
    Key? key,
    required this.global,
    this.local = const Offset(0, 0),
    required this.title,
    this.description = "",
  }) : super(key: key);

  final Offset global;
  final Offset local;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Node(
      global: global,
      local: local,
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        decoration: BoxDecoration(
          color: theme['accent'],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(description),
          ],
        ),
      ),
    );
  }
}
