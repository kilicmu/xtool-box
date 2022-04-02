import 'package:flutter/material.dart';

class LightAppStarter extends StatefulWidget {
  // ignore: constant_identifier_names
  static const ICON_HEIGHT = 56.0;
  const LightAppStarter(
      {Key? key,
      this.assetImage = const AssetImage("images/question-mark.png"),
      this.appName = "unknown app",
      required this.namedRouteMark})
      : super(key: key);

  final AssetImage assetImage;
  final String appName;
  final String namedRouteMark;

  @override
  State<LightAppStarter> createState() => _LightAppStarterState();
}

class _LightAppStarterState extends State<LightAppStarter> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(widget.namedRouteMark,
            arguments: AppArguments(name: widget.appName)),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 179, 179, 179),
                          blurRadius: 4.0,
                          blurStyle: BlurStyle.outer),
                    ],
                    borderRadius:
                        BorderRadius.circular(LightAppStarter.ICON_HEIGHT)),
                child: Image(
                    image: widget.assetImage,
                    width: LightAppStarter.ICON_HEIGHT,
                    height: LightAppStarter.ICON_HEIGHT)),
            Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text(
                  widget.appName,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ))
          ],
        ));
  }
}

class AppArguments {
  AppArguments({required this.name});
  String name;
}
