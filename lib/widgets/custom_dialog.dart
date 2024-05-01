import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/color_constant.dart';

enum DialogStatus { success, error }

class CustomDialog {
  CustomDialog({
    required this.context,
  });

  final BuildContext context;

  void showLoadingDialog() {
    showDialog<Dialog>(
        context: context,
        builder: (BuildContext dialogConext) {
          return FutureBuilder(
              future: Future<dynamic>.delayed(const Duration(seconds: 1))
                  .then((value) => true),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  print('call vao day');
                  Navigator.of(context).pop();
                }
                return Dialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(
                          color: ColorConstant.whiteColor,
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }

  void showLoadingNoAutoOffDialog() {
    showDialog<Dialog>(
        context: context,
        builder: (BuildContext dialogConext) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: ColorConstant.whiteColor,
                  ),
                ],
              ),
            ),
          );
        });
  }

  void showCustomDialog(
      {required String notificationText, required DialogStatus dialogStatus}) {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext ctx) {
        return FutureBuilder(
            future: Future<dynamic>.delayed(const Duration(seconds: 2))
                .then((value) => true),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Navigator.of(context).pop();
              }

              return AlertDialog(
                contentPadding: EdgeInsets.zero,
                content: Container(
                  height: 120.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: dialogStatus == DialogStatus.error
                          ? ColorConstant.redColor
                          : ColorConstant.greenColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Icon(
                    dialogStatus == DialogStatus.error
                        ? Icons.error_outline
                        : Icons.done,
                    size: 50,
                    color: ColorConstant.whiteColor,
                  ),
                ),
                actions: <Widget>[
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: Text(
                          notificationText,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorConstant.black87Color),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            });
      },
    );
  }

  void showCustomDialogNoAutoOff(
      {required String notificationText, required DialogStatus dialogStatus}) {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: 120.h,
            width: 100.w,
            decoration: BoxDecoration(
                color: dialogStatus == DialogStatus.error
                    ? ColorConstant.redColor
                    : ColorConstant.greenColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Icon(
              dialogStatus == DialogStatus.error
                  ? Icons.error_outline
                  : Icons.done,
              size: 50,
              color: ColorConstant.whiteColor,
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Text(
                    notificationText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorConstant.black87Color),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
