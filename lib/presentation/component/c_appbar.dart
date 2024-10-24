import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  final Widget title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? trailing;
  final bool? isBack;
  final bool? isBlur;
  const CustomAppbar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.actions,
    this.leading,
    this.trailing,
    this.isBack = false,
    this.isBlur = true,
  });

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.title,
      centerTitle: widget.centerTitle,
      actions: widget.actions,
      leading: widget.leading,
    );
  }
}
