import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

void main() => runApp(FlutterCreate());

class FlutterCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: LampScreen()));
  }
}

class LampScreen extends StatefulWidget {
  @override
  _LampScreenState createState() => _LampScreenState();
}

class _LampScreenState extends State<LampScreen>
    with SingleTickerProviderStateMixin {
  Offset ds;
  double dy = 0.0;
  bool on = false;
  bool da = true;
  AnimationController ac;
  Animation<double> ady;
  MaterialColor cs = Colors.deepPurple;
  @override
  void initState() {
    ac = AnimationController(duration: Duration(milliseconds: 500), vsync: this)
      ..addListener(() {
        setState(() {
          dy = ady.value;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    ac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double xs = 411.430;
    double ys = 683.428;
    double ratio = min(w / xs, h / ys);
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: cs.shade300,
        child: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Transform.scale(
                scale: ratio,
                alignment: Alignment.topCenter,
                child: SizedBox(
                    width: xs,
                    height: ys,
                    child: CustomPaint(
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Transform.translate(
                              offset: Offset(0, 505),
                              child: Text('#FlutterCreate',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900,
                                      color: cs.shade300))),
                          Transform.translate(
                              offset: Offset(150, 350 + dy),
                              child: Container(
                                width: 75,
                                height: 75,
                                child: GestureDetector(
                                  onVerticalDragStart: (d) {
                                    ds = d.globalPosition;
                                    da = true;
                                  },
                                  onVerticalDragUpdate: (d) {
                                    if (da) {
                                      setState(() {
                                        dy = (d.globalPosition.dy - ds.dy)
                                            .clamp(0.0, 50.0);
                                        da = dy == 50.0 ? false : true;
                                        on = dy == 50.0 ? !on : on;
                                      });
                                    }
                                  },
                                  onVerticalDragEnd: (d) {
                                    ady = Tween<double>(begin: dy, end: 0)
                                        .animate(ac);
                                    ac.forward(from: 0.0);
                                  },
                                ),
                              ))
                        ]),
                        painter: MyPainter(
                          cs,
                          on,
                          dy,
                        )))),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 60,
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Colors.primaries.length,
                      itemBuilder: (_, i) => GestureDetector(
                          onTap: () {
                            setState(() {
                              cs = Colors.primaries[i];
                            });
                          },
                          child: Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.primaries[i])))))),
        ]));
  }
}

class MyPainter extends CustomPainter {
  final MaterialColor cs;
  final bool on;
  final double dy;
  MyPainter(this.cs, this.on, this.dy);
  @override
  void paint(Canvas c, Size s) {
    print(s.width);
    print(s.height);
    final double w = s.width;
    final double m = w / 2;
    Paint pa = Paint();
    Path p;
    if (on) {
      c.drawOval(
          Rect.fromLTWH(m - 140, 490, 280, 60), pa..color = Color(0xFFFFFFFF));
      Path p = Path()
        ..moveTo(m - 109, 255)
        ..relativeLineTo(218, 0)
        ..relativeLineTo(30, 260)
        ..relativeLineTo(-280, 0)
        ..close();
      c.drawPath(p, pa..color = Color(0x20FFFFFF));
    }
    c.drawOval(Rect.fromLTWH(m - 109, 238, 218, 40),
        pa..color = on ? Color(0xFFDE574A) : cs.shade900);
    c.drawCircle(
        Offset(m, 200), 60, pa..color = on ? Color(0xFFFAD14A) : cs.shade800);
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
    p = Path()
      ..moveTo(w / 2 + 150, 0)
      ..relativeLineTo(0, 350 + dy)
      ..relativeLineTo(-2, 0)
      ..relativeLineTo(-2, 15)
      ..relativeLineTo(13, 0)
      ..relativeLineTo(-2, -15)
      ..relativeLineTo(-2, 0)
      ..relativeLineTo(0, -350 - dy)
      ..close();
    c.drawPath(p, pa..color = cs.shade900);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
