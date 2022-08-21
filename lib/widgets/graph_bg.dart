import 'package:flutter/widgets.dart';
import 'package:topono/theme.dart';

class GraphBackground extends StatelessWidget {
  const GraphBackground({Key? key, required this.offset}) : super(key: key);

  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        color: theme['body-bg'],
        child: _GridBackground(offset: offset),
      ),
    );
  }
}

// Modified GridPaper to have an offset

class _GridPaperPainter extends CustomPainter {
  _GridPaperPainter({
    required this.color,
    required this.interval,
    required this.divisions,
    required this.subdivisions,
    required this.offset,
  });

  final Color color;
  final double interval;
  final int divisions;
  final int subdivisions;
  final Offset offset;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()..color = color;
    final double allDivisions = (divisions * subdivisions).toDouble();

    double xOffset = offset.dx % size.width;
    double yOffset = offset.dy % size.height;
    Offset origin = Offset(xOffset, yOffset);

    for (double x = 0.0; x <= (2 * size.width); x += interval / allDivisions) {
      linePaint.strokeWidth = (x % interval == 0.0)
          ? 1.0
          : (x % (interval / subdivisions) == 0.0)
              ? 0.5
              : 0.25;

      double xp = (x + xOffset) - size.width;
      canvas.drawLine(
        Offset(xp, 0.0),
        Offset(xp, size.height),
        linePaint,
      );
    }
    for (double y = 0.0; y <= (2 * size.height); y += interval / allDivisions) {
      linePaint.strokeWidth = (y % interval == 0.0)
          ? 1.0
          : (y % (interval / subdivisions) == 0.0)
              ? 0.5
              : 0.25;

      double yp = (y + yOffset) - size.height;
      canvas.drawLine(
        Offset(0.0, yp),
        Offset(size.width, yp),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(_GridPaperPainter oldPainter) {
    return oldPainter.color != color ||
        oldPainter.interval != interval ||
        oldPainter.divisions != divisions ||
        oldPainter.subdivisions != subdivisions ||
        oldPainter.offset != offset;
  }

  @override
  bool hitTest(Offset position) => false;
}

class _GridBackground extends StatelessWidget {
  const _GridBackground({
    Key? key,
    this.color = const Color(0xFF111111),
    this.interval = 100.0,
    this.divisions = 2,
    this.subdivisions = 5,
    this.offset = const Offset(0, 0),
    this.child,
  })  : assert(divisions > 0,
            'The "divisions" property must be greater than zero. If there were no divisions, the grid paper would not paint anything.'),
        assert(subdivisions > 0,
            'The "subdivisions" property must be greater than zero. If there were no subdivisions, the grid paper would not paint anything.'),
        super(key: key);

  final Color color;
  final double interval;
  final int divisions;
  final int subdivisions;
  final Offset offset;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CustomPaint(
        foregroundPainter: _GridPaperPainter(
          color: color,
          interval: interval,
          divisions: divisions,
          subdivisions: subdivisions,
          offset: offset,
        ),
        child: child,
      ),
    );
  }
}
