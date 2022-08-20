import 'package:flutter/material.dart';
import 'package:topono/theme.dart';
import 'package:topono/widgets/ribbon_button.dart';

class Ribbon extends StatefulWidget {
  const Ribbon({Key? key}) : super(key: key);

  @override
  State<Ribbon> createState() => _RibbonState();
}

class _RibbonState extends State<Ribbon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme['ribbon-bg'],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          RibbonButton(
            label: "Reset View",
            icon: Icons.grid_on,
          ),
          RibbonButton(
            label: "Align Items",
            icon: Icons.align_horizontal_center,
          ),
          RibbonButton(
            label: "Settings",
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}
