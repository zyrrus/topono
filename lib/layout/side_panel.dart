import 'package:flutter/material.dart';
import 'package:topono/theme.dart';

class SidePanel extends StatefulWidget {
  const SidePanel({Key? key}) : super(key: key);

  @override
  State<SidePanel> createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme['panel-bg'],
      ),
      child: Text(
        "Panel",
        style: TextStyle(
          color: theme['fg'],
        ),
      ),
    );
  }
}
