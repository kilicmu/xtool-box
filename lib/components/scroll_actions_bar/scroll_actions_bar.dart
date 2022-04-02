import 'package:flutter/material.dart';

class ScrollActionsBar extends StatefulWidget {
  ScrollActionsBar(
      {Key? key, required this.mainWidget, this.actions = const <Widget>[]})
      : super(key: key);

  Widget mainWidget;
  List<Widget> actions;
  @override
  State<ScrollActionsBar> createState() => _ScrollActionsBarState();
}

class _ScrollActionsBarState extends State<ScrollActionsBar> {
  @override
  Widget build(BuildContext context) {
    final mainWidth = MediaQuery.of(context).size.width;
    final onActionWidth = mainWidth / 4;
    return SingleChildScrollView(
        child: Container(
      width: mainWidth + onActionWidth * widget.actions.length,
      child: Row(children: [widget.mainWidget, ...widget.actions]),
    ));
  }
}
