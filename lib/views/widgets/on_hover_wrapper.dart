import 'package:flutter/material.dart';

class OnHoverWrapper extends StatefulWidget {
  const OnHoverWrapper({super.key, required this.builder});

  final Widget Function(bool isHovered) builder;

  @override
  State<OnHoverWrapper> createState() => _OnHoverWrapperState();
}

class _OnHoverWrapperState extends State<OnHoverWrapper> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoverTransfom = Matrix4.identity();
    // ..scale(1.2)
    // ..translate(-4, -8, 0);
    final transform = isHovered ? hoverTransfom : Matrix4.identity();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => _onEnter(true),
      onExit: (event) => _onExit(false),
      child: AnimatedContainer(
        transform: transform,
        duration: const Duration(milliseconds: 200),
        child: widget.builder.call(isHovered),
      ),
    );
  }

  void _onEnter(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });

  void _onExit(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
