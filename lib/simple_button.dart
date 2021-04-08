import 'package:flutter/material.dart';
import 'dart:async';

class SimpleButton extends StatefulWidget {
  final void Function() onTap, onTapDown;
  final IconData icon;
  final double size;

  const SimpleButton({
    Key key,
    @required this.onTap,
    this.onTapDown,
    @required this.icon,
    this.size = 32
  }) : super(key: key);

  @override
  _SimpleButtonState createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> {
  Timer timer;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Theme.of(context).accentColor,
        child: GestureDetector(
          child: InkWell(
            onTap: widget.onTap,
            child: SizedBox(
              width: widget.size,
              height: widget.size,
              child: Icon(
                widget.icon,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
          onTapDown: (TapDownDetails details) {
            if (widget.onTapDown != null) {
              timer = Timer.periodic(Duration(milliseconds: 75), (timer) {
                widget.onTapDown();
              });
            }
          },
          onTapUp: (TapUpDetails details) {
            if (timer != null) {
              timer.cancel();
            }
          },
          onTapCancel: () {
            if (timer != null) {
              timer.cancel();
            }
          },
          onHorizontalDragStart: (DragStartDetails details) {
            if (timer != null) {
              timer.cancel();
            }
          },
          onVerticalDragStart: (DragStartDetails details) {
            if (timer != null) {
              timer.cancel();
            }
          },
        ),
      ),
    );
  }
}