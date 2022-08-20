import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/widgets.dart';
import 'package:topono/theme.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Container(
        decoration: BoxDecoration(color: theme['ribbon-bg']),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: MoveWindow()),
            MinimizeWindowButton(),
            MaximizeWindowButton(),
            CloseWindowButton()
          ],
        ),
      ),
    );
  }
}
