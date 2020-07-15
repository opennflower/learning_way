import 'package:flutter/material.dart';

class CNText extends StatefulWidget{
   CNText(this.text, {this.color = Colors.black, this.fontWeight = FontWeight.w400, this.height,this.size = 14, this.align: TextAlign.left, this.overflow = TextOverflow.ellipsis, this.maxLines, this.decoration});
    final String text;
    final Color color;
    final FontWeight fontWeight;
    final double size;
    final double height;
    final TextAlign align;
    final TextOverflow overflow;
    final int maxLines;
    final TextDecoration decoration;

    @override
    State<StatefulWidget> createState() {
        return CNTextState();
    }
}

class CNTextState extends State<CNText> {
    @override
    Widget build(BuildContext context) {
        return Text(widget.text,
            textAlign: widget.align,
            overflow: widget.overflow,
            style: TextStyle(
                color: widget.color,
                fontWeight: widget.fontWeight,
                fontSize: widget.size,
                decoration: widget.decoration,
                height: widget.height,
            ),
            maxLines: widget.maxLines,
        );
    }
  
}