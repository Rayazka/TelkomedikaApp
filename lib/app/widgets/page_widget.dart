import 'dart:ui';

import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  final Widget child;
  final Widget? bottomNavigationBar;

  const PageWidget({super.key, required this.child, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FC),
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(fit: StackFit.expand, children: [
        Positioned(
          right: -50,
          top: -49,
          child: _bluredCircle(color: 0xFF1B4DEA),
        ),
        Positioned(
          left: -66,
          bottom: -72,
          child: _bluredCircle(color: 0xFFF86780),
        ),
        SafeArea(child: child)
      ]),
    );
  }

  Container _bluredCircle({required int color}) {
    return Container(
      width: 161,
      height: 161,
      decoration: BoxDecoration(
          color: Color(color).withOpacity(.4),
          borderRadius: BorderRadius.circular(161 / 2)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(),
      ),
    );
  }
}
