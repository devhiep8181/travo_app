// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../core/utils/color_constant.dart';

///CustomPainter
///
///Cần triển khai 2 phương thức chính: paint và shouldRepaint
///
///[paint]: chịu trách nhiệm vẽ hình lên màn hình
///
///nhận 2 tham số: Canvas và size
///
///Canvas: thực hiện hành động vẽ
///
///Size: kích thước của hình vẽ
///
///[shouldRepaint]: xác định xem có cần vẽ lại hình không.
///Kiểu kiểu khi dữ liệu thay đổi thì vẽ ấy
///
///Các thuộc tính khi vẽ
///color: màu của hình vẽ
///style: kiểu vẽ
///blendMode: chế độ hỗn hợp cho màu vẽ
///colorFilter: áp dụng bộ lọc màu
///filterQuality: chất lượng lọc => dành cho vẽ ảnh
///invertColors: đảo ngược màu sắc
///maskFilter: bộ lọc mặt lạ
///shader: thiết lập hiệu ứng màu sắc phức tạp
///strokeCap: xác định đầu mút của đường vẽ(vd: tròn hoặc vuông)
///strokeMiterLimit: xác định cách nối các phần của đường vẽ

class CustomMyPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorConstant.grey200Color.withOpacity(0.2)
      ..strokeWidth = 30
      ..style = PaintingStyle.stroke;
//center là tâm hình tròn
//drawArc vẽ từ tâm hình tròn theo các góc
    final rect2 = Rect.fromCircle(center: Offset(350.w, 142.h), radius: 80.r);
    final rect = Rect.fromCircle(center: Offset.zero, radius: 100.r);
    canvas
      ..drawArc(rect, -pi / 2, pi, false, paint)
      ..drawArc(rect2, 10 * pi / 9, pi, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
