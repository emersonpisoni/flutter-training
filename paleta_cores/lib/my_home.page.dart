import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class ColorUtils {
  static Color fromHex(String hexCode) {
    final colorHexRegex = RegExp('(#{0,1})([0-9a-fA-F]{6})');
    if (!colorHexRegex.hasMatch(hexCode)) {
      throw Exception('"$hexCode" is not a valid color code');
    }
    hexCode = hexCode.replaceFirst('#', '0');

    return Color(0xff000000 + int.parse(hexCode, radix: 16));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController color1Controller =
      TextEditingController(text: '#e2b4bd');
  TextEditingController color2Controller =
      TextEditingController(text: '#ffffff');
  TextEditingController color3Controller =
      TextEditingController(text: '#e2b4bd');

  String color1 = '#e2b4bd';
  String color2 = '#ffffff';
  String color3 = '#e2b4bd';

  _updateColors() {
    setState(() {
      color1 = color1Controller.text;
      color2 = color2Controller.text;
      color3 = color3Controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 40),
                  color: ColorUtils.fromHex(color1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        child: TextField(
                          controller: color1Controller,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 40),
                  color: ColorUtils.fromHex(color2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        child: TextField(
                          controller: color2Controller,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 40),
                  color: ColorUtils.fromHex(color3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        child: TextField(
                          controller: color3Controller,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 10,
                  bottom: 10,
                ),
                child: RaisedButton(
                  onPressed: _updateColors,
                  padding: EdgeInsets.all(0),
                  child: Container(
                    color: Colors.grey[300],
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Atualizar',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
