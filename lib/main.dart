import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:topono/layout/graph.dart';
import 'package:topono/layout/layout.dart';
import 'package:topono/layout/ribbon.dart';
import 'package:topono/layout/side_panel.dart';

// bitsdojo window title bar
// https://www.youtube.com/watch?v=bee2AHQpGK4

void main() {
  runApp(const Topono());
  doWhenWindowReady(() {
    const initialSize = Size(600, 450);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = "Topono";
    appWindow.show();
  });
}

class Topono extends StatelessWidget {
  const Topono({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Topono',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Layout(
        body: Graph(),
        panel: SidePanel(),
        ribbon: Ribbon(),
      ),
    );
  }
}
