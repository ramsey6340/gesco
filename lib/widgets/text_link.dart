import 'package:flutter/material.dart';
import '../constantes.dart';


class TextLink extends StatefulWidget {
  const TextLink({
    super.key,
    required this.text,
    this.onTap,
    this.hoverColor=kPrimaryColor,
    this.textColor=Colors.black
  });

  final String text;
  final void Function()? onTap;
  final Color? hoverColor;
  final Color? textColor;
  @override
  State<TextLink> createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _hovering = false;
        });
      },
      child: InkWell(
        onTap: widget.onTap,
        child: Text(widget.text,
          style: TextStyle(
            color: _hovering ? widget.hoverColor : widget.textColor,
          ),
        ),
      ),
    );
  }
}