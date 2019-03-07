import 'package:flutter/material.dart';

void main() => runApp(FlutterCreate());

class FlutterCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', home: Scaffold(body: LampScreen()));
  }
}

class LampScreen extends StatefulWidget {
  @override
  _LampScreenState createState() => _LampScreenState();
}

class _LampScreenState extends State<LampScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  static MaterialColor cs = Colors.blueGrey;
  TextStyle t = TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: cs.shade600);

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        width: double.infinity,
        height: double.infinity,
        color: cs.shade600,
        child: Stack(children: [
          SizedBox.expand(child: CustomPaint(painter: MyPainter(cs))),
          Positioned(
              top: 505,
              left: 125,
              child: Text('#FlutterCreate', style: t)),
        ]));
  }
}

class MyPainter extends CustomPainter {
  final MaterialColor cs;
  MyPainter(this.cs);

  @override
  void paint(Canvas c, Size s) {
    final w = s.width;
    final m = w / 2;
    final h = s.height;
    final List<Color> z = [
      Color(0xFFFFFFFF),
      Color(0x20FFFFFF),
      Color(0xFFDE574A),
      Color(0xFFFAD14A)
    ];

    Paint pa = Paint();
    c.drawOval(Rect.fromLTWH(m - 140, 490, 280, 60), pa..color = z[0]);
    Path p = Path()
      ..moveTo(m - 109, 255)
      ..relativeLineTo(218, 0)
      ..relativeLineTo(30, 260)
      ..relativeLineTo(-280, 0)
      ..close();
    c.drawPath(p, pa..color = z[1]);
    c.drawOval(Rect.fromLTWH(m - 109, 238, 218, 40), pa..color = z[2]);
    c.drawCircle(Offset(m, 200), 60, pa..color = z[3]);
    p = Path()
      ..moveTo(m - 5, 0)
      ..relativeLineTo(0, 100)
      ..relativeLineTo(10, 0)
      ..relativeLineTo(0, -100)
      ..close();
    c.drawPath(p, pa..color = cs.shade900);
    p = Path()
      ..moveTo(m - 60, 100)
      ..relativeQuadraticBezierTo(0, -10, 60, -10)
      ..relativeQuadraticBezierTo(60, 0, 60, 10)
      ..relativeLineTo(10, 60)
      ..relativeLineTo(-140, 0)
      ..close();
    c.drawPath(p, pa..color = cs.shade800);
    p = Path()
      ..moveTo(m - 100, 160)
      ..relativeQuadraticBezierTo(0, -10, 100, -10)
      ..relativeQuadraticBezierTo(100, 0, 100, 10)
      ..relativeLineTo(10, 100)
      ..relativeQuadraticBezierTo(0, -20, -110, -20)
      ..relativeQuadraticBezierTo(-110, 0, -110, 20)
      ..close();
    c.drawPath(p, pa..color = cs.shade700);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
