// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = const Color(0xffE5E2FF).withOpacity(1.0);
canvas.drawOval(Rect.fromCenter(center:Offset(size.width*0.5164316,size.height*0.5448140),width:size.width*0.7042253,height:size.height*0.9080224),paint_0_fill);

Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
paint_1_fill.color = const Color(0xff3629B7).withOpacity(1.0);
canvas.drawOval(Rect.fromCenter(center:Offset(size.width*0.3615021,size.height*0.03026741),width:size.width*0.04694832,height:size.height*0.06053483),paint_1_fill);

Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
paint_2_fill.color = const Color(0xffFF4267).withOpacity(1.0);
canvas.drawOval(Rect.fromCenter(center:Offset(size.width*0.9413158,size.height*0.2088455),width:size.width*0.1173705,height:size.height*0.1513371),paint_2_fill);

Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
paint_3_fill.color = const Color(0xff0890FE).withOpacity(1.0);
canvas.drawOval(Rect.fromCenter(center:Offset(size.width*0.8591526,size.height*0.8232727),width:size.width*0.04694832,height:size.height*0.06053483),paint_3_fill);

Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
paint_4_fill.color = const Color(0xffFFAF2A).withOpacity(1.0);
canvas.drawOval(Rect.fromCenter(center:Offset(size.width*0.2441316,size.height*0.8232727),width:size.width*0.09389674,height:size.height*0.1210697),paint_4_fill);

Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
paint_5_fill.color = const Color(0xff52D5BA).withOpacity(1.0);
canvas.drawOval(Rect.fromCenter(center:Offset(size.width*0.02347416,size.height*0.4237448),width:size.width*0.04694832,height:size.height*0.06053483),paint_5_fill);

Path path_6 = Path();
    path_6.moveTo(107.522,72.1293);
    path_6.cubicTo(106.971,72.1293,106.501,71.687,106.501,71.15);
    path_6.lineTo(106.501,62.5264);
    path_6.cubicTo(106.501,58.0093,102.741,54.3451,98.1058,54.3451);
    path_6.cubicTo(93.4707,54.3451,89.7107,58.0251,89.7107,62.5264);
    path_6.lineTo(89.7107,71.15);
    path_6.cubicTo(89.7107,71.687,89.257,72.1293,88.6897,72.1293);
    path_6.lineTo(83.0498,72.1293);
    path_6.cubicTo(82.4987,72.1293,82.045,71.687,82.045,71.15);
    path_6.lineTo(82.045,62.5264);
    path_6.cubicTo(82.045,53.887,89.257,46.8586,98.122,46.8586);
    path_6.cubicTo(106.987,46.8586,114.199,53.887,114.199,62.5264);
    path_6.lineTo(114.199,71.15);
    path_6.cubicTo(114.199,71.687,113.745,72.1293,113.178,72.1293);
    path_6.lineTo(107.522,72.1293);
    path_6.close();

Paint paint_6_fill = Paint()..style=PaintingStyle.fill;
paint_6_fill.color = const Color(0xff5655B9).withOpacity(1.0);
canvas.drawPath(path_6,paint_6_fill);

Path path_7 = Path();
    path_7.moveTo(98.122,47.8379);
    path_7.cubicTo(106.42,47.8379,113.178,54.424,113.178,62.5106);
    path_7.lineTo(113.178,71.1342);
    path_7.lineTo(107.538,71.1342);
    path_7.lineTo(107.538,62.5106);
    path_7.cubicTo(107.538,57.4565,103.324,53.3342,98.122,53.3342);
    path_7.cubicTo(92.9359,53.3342,88.7059,57.4407,88.7059,62.5106);
    path_7.lineTo(88.7059,71.1342);
    path_7.lineTo(83.066,71.1342);
    path_7.lineTo(83.066,62.5106);
    path_7.cubicTo(83.066,54.424,89.808,47.8379,98.122,47.8379);
    path_7.close();
    path_7.moveTo(98.122,45.8794);
    path_7.cubicTo(88.7059,45.8794,81.0401,53.35,81.0401,62.5264);
    path_7.lineTo(81.0401,71.15);
    path_7.cubicTo(81.0401,72.2398,81.9477,73.1243,83.066,73.1243);
    path_7.lineTo(88.7059,73.1243);
    path_7.cubicTo(89.8242,73.1243,90.7318,72.2398,90.7318,71.15);
    path_7.lineTo(90.7318,62.5264);
    path_7.cubicTo(90.7318,58.5621,94.0379,55.3243,98.122,55.3243);
    path_7.cubicTo(102.19,55.3243,105.512,58.5621,105.512,62.5264);
    path_7.lineTo(105.512,71.15);
    path_7.cubicTo(105.512,72.2398,106.42,73.1243,107.538,73.1243);
    path_7.lineTo(113.178,73.1243);
    path_7.cubicTo(114.296,73.1243,115.204,72.2398,115.204,71.15);
    path_7.lineTo(115.204,62.5264);
    path_7.cubicTo(115.204,53.3342,107.538,45.8794,98.122,45.8794);
    path_7.close();

Paint paint_7_fill = Paint()..style=PaintingStyle.fill;
paint_7_fill.color = Colors.white.withOpacity(1.0);
canvas.drawPath(path_7,paint_7_fill);

Path path_8 = Path();
    path_8.moveTo(79.2898,108.108);
    path_8.cubicTo(77.9285,108.108,76.8264,107.034,76.8264,105.708);
    path_8.lineTo(76.8264,72.5556);
    path_8.cubicTo(76.8264,71.2289,77.9285,70.1549,79.2898,70.1549);
    path_8.lineTo(116.954,70.1549);
    path_8.cubicTo(118.316,70.1549,119.418,71.2289,119.418,72.5556);
    path_8.lineTo(119.418,105.692);
    path_8.cubicTo(119.418,107.018,118.316,108.092,116.954,108.092);
    path_8.lineTo(79.2898,108.092);
    path_8.lineTo(79.2898,108.108);
    path_8.close();

Paint paint_8_fill = Paint()..style=PaintingStyle.fill;
paint_8_fill.color = const Color(0xff5655B9).withOpacity(1.0);
canvas.drawPath(path_8,paint_8_fill);

Path path_9 = Path();
    path_9.moveTo(116.954,71.15);
    path_9.cubicTo(117.748,71.15,118.397,71.7818,118.397,72.5715);
    path_9.lineTo(118.397,105.708);
    path_9.cubicTo(118.397,106.481,117.748,107.129,116.954,107.129);
    path_9.lineTo(79.2898,107.129);
    path_9.cubicTo(78.4795,107.129,77.8474,106.497,77.8474,105.708);
    path_9.lineTo(77.8474,72.5557);
    path_9.cubicTo(77.8474,71.7818,78.4957,71.1342,79.2898,71.1342);
    path_9.lineTo(116.954,71.1342);
    path_9.lineTo(116.954,71.15);
    path_9.close();
    path_9.moveTo(116.954,69.1757);
    path_9.lineTo(79.2898,69.1757);
    path_9.cubicTo(77.3774,69.1757,75.8216,70.692,75.8216,72.5557);
    path_9.lineTo(75.8216,105.692);
    path_9.cubicTo(75.8216,107.555,77.3774,109.072,79.2898,109.072);
    path_9.lineTo(116.954,109.072);
    path_9.cubicTo(118.867,109.072,120.423,107.555,120.423,105.692);
    path_9.lineTo(120.423,72.5557);
    path_9.cubicTo(120.423,70.692,118.867,69.1757,116.954,69.1757);
    path_9.close();

Paint paint_9_fill = Paint()..style=PaintingStyle.fill;
paint_9_fill.color = Colors.white.withOpacity(1.0);
canvas.drawPath(path_9,paint_9_fill);

Path path_10 = Path();
    path_10.moveTo(116.954,71.15);
    path_10.lineTo(109.596,71.15);
    path_10.lineTo(109.596,97.2735);
    path_10.cubicTo(109.596,98.0474,108.948,98.6791,108.138,98.6791);
    path_10.lineTo(77.8312,98.6791);
    path_10.lineTo(77.8312,105.692);
    path_10.cubicTo(77.8312,106.466,78.4795,107.113,79.2736,107.113);
    path_10.lineTo(116.938,107.113);
    path_10.cubicTo(117.732,107.113,118.381,106.481,118.381,105.692);
    path_10.lineTo(118.381,72.5556);
    path_10.cubicTo(118.397,71.7817,117.748,71.15,116.954,71.15);
    path_10.close();

Paint paint_10_fill = Paint()..style=PaintingStyle.fill;
paint_10_fill.color = const Color(0xff5655B9).withOpacity(1.0);
canvas.drawPath(path_10,paint_10_fill);

Path path_11 = Path();
    path_11.moveTo(116.954,71.15);
    path_11.lineTo(114.199,71.15);
    path_11.lineTo(114.199,101.222);
    path_11.cubicTo(114.199,102.012,113.551,102.628,112.741,102.628);
    path_11.lineTo(77.8312,102.628);
    path_11.lineTo(77.8312,105.708);
    path_11.cubicTo(77.8312,106.481,78.4795,107.129,79.2736,107.129);
    path_11.lineTo(116.938,107.129);
    path_11.cubicTo(117.732,107.129,118.381,106.497,118.381,105.708);
    path_11.lineTo(118.381,72.5556);
    path_11.cubicTo(118.397,71.7817,117.748,71.15,116.954,71.15);
    path_11.close();

Paint paint_11_fill = Paint()..style=PaintingStyle.fill;
paint_11_fill.color = const Color(0xff5655B9).withOpacity(1.0);
canvas.drawPath(path_11,paint_11_fill);

Path path_12 = Path();
    path_12.moveTo(96.5584,92.8512);
    path_12.cubicTo(96.5584,92.5901,96.3959,92.3565,96.1511,92.2658);
    path_12.cubicTo(94.0796,91.4981,92.6364,89.5578,92.6364,87.3074);
    path_12.cubicTo(92.6364,84.4001,95.0784,82.0089,98.1058,82.0089);
    path_12.cubicTo(101.148,82.0089,103.575,84.399,103.575,87.3074);
    path_12.cubicTo(103.575,89.5578,102.132,91.4981,100.061,92.2658);
    path_12.cubicTo(99.8157,92.3565,99.6532,92.5901,99.6532,92.8512);
    path_12.lineTo(99.6532,95.631);
    path_12.cubicTo(99.6532,96.4399,98.9756,97.1231,98.1058,97.1231);
    path_12.cubicTo(97.236,97.1231,96.5584,96.4398,96.5584,95.631);
    path_12.lineTo(96.5584,92.8512);
    path_12.close();

Paint paint_12_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.006571579;
paint_12_stroke.color=Colors.white.withOpacity(1.0);
paint_12_stroke.strokeCap = StrokeCap.round;
paint_12_stroke.strokeJoin = StrokeJoin.round;
canvas.drawPath(path_12,paint_12_stroke);

Paint paint_12_fill = Paint()..style=PaintingStyle.fill;
paint_12_fill.color = const Color(0xff5655B9).withOpacity(1.0);
canvas.drawPath(path_12,paint_12_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}