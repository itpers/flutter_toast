import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toast {
  static OverlayEntry _overlayEntry;
  static Timer _timer;

  /// 显示 Toast
  /// [msg] 显示信息
  /// [bgColor] 背景颜色
  /// [textColor] 文字颜色
  /// [textSize] 文字大小
  /// [duration] 显示时长(单位毫秒)
  static show(BuildContext context, String msg,
      {Color bgColor,
      Color textColor = Colors.white,
      double textSize = 14,
      int duration = 2000}) {
    dismiss();

    if (bgColor == null) bgColor = Colors.black.withOpacity(0.7);

    _overlayEntry = new OverlayEntry(builder: (context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return IgnorePointer(
            ignoring: true,
            child: Material(
              color: Colors.white.withOpacity(0),
              child: Container(
                child: Container(
                  child: Text(
                    "$msg",
                    style: TextStyle(color: textColor, fontSize: textSize),
                  ),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: constraints.biggest.height * 0.15,
                  bottom: constraints.biggest.height * 0.15,
                  left: constraints.biggest.width * 0.2,
                  right: constraints.biggest.width * 0.2,
                ),
              ),
            ),
          );
        },
      );
    });

    Overlay.of(context).insert(_overlayEntry);
    _timer = Timer(Duration(milliseconds: duration), () => dismiss());
  }

  ///取消 Toast
  static dismiss() {
    _timer?.cancel();
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
