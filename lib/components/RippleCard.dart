import 'package:flutter/material.dart';

class RippleCard extends StatefulWidget {
  final String text;
  final String? detail;
  final Function() func;

  RippleCard({required this.text, required this.func, this.detail, Key? key})
      : super(key: key);

  @override
  _RippleCardState createState() => _RippleCardState();
}

class _RippleCardState extends State<RippleCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
            onTap: widget.func,
            child: ListTile(
                title: Text(widget.text),
                subtitle: widget.detail?.isNotEmpty == true ? Text(widget.detail!) : null
            )));
  }
}
