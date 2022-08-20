import 'package:flutter/widgets.dart';
import 'package:topono/layout/title_bar.dart';

class Layout extends StatelessWidget {
  const Layout({
    Key? key,
    required this.body,
    this.ribbon,
    this.panel,
  }) : super(key: key);

  final Widget body;
  final Widget? ribbon;
  final Widget? panel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TitleBar(),
        if (ribbon != null)
          SizedBox(
            height: 100,
            child: ribbon!,
          ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (panel != null)
                SizedBox(
                  width: 300,
                  child: panel!,
                ),
              Expanded(
                child: body,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
