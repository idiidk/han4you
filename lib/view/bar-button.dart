import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;

  BarButton(this.title, {this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: this.color ?? Theme.of(context).accentColor,
      child: Ink(
        height: 50,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
