import 'package:flutter/material.dart';

class KeyboardKey extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;
  final ValueSetter<dynamic> onLongPress;

  const KeyboardKey({
    Key? key,
    required this.label,
    required this.value,
    required this.onTap,
    required this.onLongPress,
  }) : super(key: key);

  @override
  _KeyboardKeyState createState() => _KeyboardKeyState();
}

class _KeyboardKeyState extends State<KeyboardKey> {
  renderLabel() {
    if (widget.label is Widget) {
      return widget.label;
    }

    return Text(
      widget.label,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.value);
      },
      onLongPress: () {
        widget.onLongPress(widget.value);
      },
      child: Ink(
        color: Colors.white,
        child: AspectRatio(
          aspectRatio: 2,
          child: Center(
            child: renderLabel(),
          ),
        ),
      ),
    );
  }
}
