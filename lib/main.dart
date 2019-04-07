import 'package:flutter/material.dart';

void main() => runApp(FlutterCreate());

class FlutterCreate extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false, home: Scaffold(body: LampScreen()));
}
}

class LampScreen extends StatefulWidget {
@override
_LampScreenState createState() => _LampScreenState();
}

class _LampScreenState extends State<LampScreen> with TickerProviderStateMixin {
double dragStart = 0.0;
double dragDy = 0.0;
bool lampOn = false;
bool draggable = true;
bool dragging = false;
AnimationController lampController;
Animation<double> animDy;
MaterialColor color = Colors.deepPurple;
List<String> textList = [
'#FlutterCreate',
'Pixel Perfect',
'Cross Platform',
'Smooth Animations',
'Hot Reload',
'Open Source',
'5kb'
];
int textIdx = 0;
@override
void initState() {
lampController =
AnimationController(duration: Duration(milliseconds: 500), vsync: this)
..addListener(() {
setState(() {
dragDy = animDy.value;
});
});
super.initState();
}

@override
void dispose() {
lampController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
final double designW = 411.430;
final double designH = 683.428;
return Container(
width: double.infinity,
height: double.infinity,
color: color.shade300,
child: Stack(children: [
Align(
alignment: Alignment.topCenter,
child: FittedBox(
fit: BoxFit.contain,
alignment: Alignment.topCenter,
child: SizedBox(
width: designW,
height: designH,
child: CustomPaint(
child: Stack(alignment: Alignment.topCenter, children: [
Transform.translate(
offset: Offset(0, 505),
child: Text(textList[textIdx],
textAlign: TextAlign.center,
style: TextStyle(
fontSize: 25,
fontWeight: FontWeight.w900,
color: color.shade300))),
Transform.translate(
offset: Offset(152, 320 + dragDy),
child: Stack(
children: [
Visibility(
visible: dragging,
child: Container(
width: 75,
height: 75,
decoration: BoxDecoration(
borderRadius:
BorderRadius.circular(75),
color: Colors.white
.withOpacity(0.2)))),
Container(
width: 75,
height: 75,
child: GestureDetector(
onVerticalDragStart: (details) {
lampController.stop();
dragStart =
details.globalPosition.dy - dragDy;
draggable = true;
dragging = true;
},
onVerticalDragUpdate: (details) {
if (draggable) {
setState(() {
dragDy =
(details.globalPosition.dy -
dragStart)
.clamp(0.0, 50.0);
if (dragDy == 50.0) {
draggable = false;
lampOn = !lampOn;
if (lampOn) {
textIdx = textIdx ==
textList.length - 1
? 0
: textIdx + 1;
}
}
});
}
},
onVerticalDragEnd: (details) {
dragging = false;
animDy =
Tween<double>(begin: dragDy, end: 0)
.animate(lampController);
lampController.forward(from: 0.0);
},
),
)
],
))
]),
painter: LampPainter(
color,
lampOn,
dragDy,
)))),
),
Align(
alignment: Alignment.bottomCenter,
child: Container(
height: 60,
child: ListView.builder(
scrollDirection: Axis.horizontal,
itemCount: Colors.primaries.length,
itemBuilder: (_, i) => SizedBox(
width: 60,
child: Material(
color: Colors.primaries[i],
child: InkWell(
onTap: () {
setState(() {
color = Colors.primaries[i];
});
},
)))))),
]));
}
}

class LampPainter extends CustomPainter {
final MaterialColor color;
final bool lampOn;
final double dragDy;
LampPainter(this.color, this.lampOn, this.dragDy);
@override
void paint(Canvas canvas, Size size) {
final double midx = size.width / 2;
Paint paint = Paint();
if (lampOn) {
canvas.drawOval(Rect.fromLTWH(midx - 140, 490, 280, 60),
paint..color = Color(0xFFFFFFFF));
canvas.drawPath(
Path()
..moveTo(midx - 109, 255)
..relativeLineTo(218, 0)
..relativeLineTo(30, 260)
..relativeLineTo(-280, 0)
..close(),
paint..color = Color(0x20FFFFFF));
}
canvas.drawOval(Rect.fromLTWH(midx - 110, 238, 220, 40),
paint..color = lampOn ? Color(0xFFDE574A) : color.shade900);
canvas.drawCircle(Offset(midx, 200), 60,
paint..color = lampOn ? Color(0xFFFAD14A) : color.shade800);
canvas.drawPath(
Path()
..moveTo(midx - 5, 0)
..relativeLineTo(0, 100)
..relativeLineTo(10, 0)
..relativeLineTo(0, -100)
..close(),
paint..color = color.shade900);
canvas.drawPath(
Path()
..moveTo(midx - 60, 100)
..relativeQuadraticBezierTo(0, -10, 60, -10)
..relativeQuadraticBezierTo(60, 0, 60, 10)
..relativeLineTo(10, 60)
..relativeLineTo(-140, 0)
..close(),
paint..color = color.shade800);
canvas.drawPath(
Path()
..moveTo(midx - 100, 160)
..relativeQuadraticBezierTo(0, -10, 100, -10)
..relativeQuadraticBezierTo(100, 0, 100, 10)
..relativeLineTo(10, 100)
..relativeQuadraticBezierTo(0, -20, -110, -20)
..relativeQuadraticBezierTo(-110, 0, -110, 20)
..close(),
paint..color = color.shade700);
canvas.drawPath(
Path()
..moveTo(midx + 150, 0)
..relativeLineTo(0, 350 + dragDy)
..relativeLineTo(-2, 0)
..relativeLineTo(-2, 15)
..relativeLineTo(12, 0)
..relativeLineTo(-2, -15)
..relativeLineTo(-2, 0)
..relativeLineTo(0, -350 - dragDy)
..close(),
paint..color = color.shade900);
}

@override
bool shouldRepaint(CustomPainter oldDelegate) {
return oldDelegate != this;
}
}
