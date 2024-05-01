// Dart imports:
import 'dart:async';
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import '../../core/app_export.dart';
import '../auth/authen/auth_bloc.dart';
import '../booking/book_and_review/blocs/contact/contact_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenAppSate) {
            context.read<ContactBloc>().add(CallContactEvent());
            Timer(const Duration(milliseconds: 2100), () {
              context.goNamed(homeRoute);
            });
          } else if (state is GuestAppState) {
            context.pushReplacementNamed(loginRoute);
          } else if (state is FirstAppState) {
            context.pushReplacementNamed(onboardingRoute);
          }
        },
        child: Container(
          color: ColorConstant.primaryColor,
          constraints: const BoxConstraints.expand(),
          child: CustomPaint(
            painter: CustomMyPaint1(),
            child: Center(
              child: Text(
                'Travo',
                style: TextStyle(
                    color: ColorConstant.whiteColor,
                    fontSize: 64,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomMyPaint1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorConstant.grey200Color.withOpacity(0.2)
      ..strokeWidth = 30
      ..style = PaintingStyle.stroke;
//center là tâm hình tròn
//drawArc vẽ từ tâm hình tròn theo các góc
    final rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 80.r);
    final rect2 = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 150.r);
    final rect3 = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 220.r);
    final rect4 = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 290.r);
    final rect5 = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 360.r);
    canvas
      ..drawArc(rect, pi, 2 * pi, false, paint)
      ..drawArc(rect2, pi, 2 * pi, false, paint)
      ..drawArc(rect3, pi, 2 * pi, false, paint)
      ..drawArc(rect4, pi, 2 * pi, false, paint)
      ..drawArc(rect5, pi, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
