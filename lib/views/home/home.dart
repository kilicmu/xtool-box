import 'package:flutter/material.dart';
import 'package:xtool_box/views/home/light_app_starter/index.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  static const HOME_TITLE = "XTools 工具箱";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          HOME_TITLE,
          style: TextStyle(color: Colors.white),
        )),
        body: GridView.count(
          padding: const EdgeInsets.all(4.0),
          crossAxisCount: 4,
          childAspectRatio: 1.0,
          children: const [
            LightAppStarter(
                assetImage: AssetImage("images/picture-upload-icon.png"),
                appName: "轻图床",
                namedRouteMark: "picture_upload"),
          ],
        ));
  }
}
