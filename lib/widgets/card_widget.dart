import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget(
      {Key? key,
      required this.title,
      required this.leading,
      required this.height,
      required this.widgets})
      : super(key: key);

  final String title;
  final Widget leading;
  final double height;
  final List<Widget> widgets;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> allWidgets = [
      ListTile(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: widget.leading,
      ),
      const Divider(),
    ];

    allWidgets.addAll(widget.widgets);

    return SizedBox(
      height: widget.height,
      child: Card(
        elevation: 15.0,
        child: Column(
          children: allWidgets,
        ),
      ),
    );
  }
}
