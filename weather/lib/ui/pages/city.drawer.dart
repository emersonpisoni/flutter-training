import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityDrawer extends StatelessWidget {
  final Function(int) onTap;

  const CityDrawer({this.onTap});

  _onButtonPressed(int woeid, BuildContext context) {
    Navigator.of(context).pop();
    onTap(woeid);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Selecione a sua cidade'),
          ),
          CupertinoButton(
            child: Text('Porto Alegre'),
            onPressed: () => _onButtonPressed(455823, context),
          ),
          CupertinoButton(
            child: Text('São Leopoldo'),
            onPressed: () => _onButtonPressed(461140, context),
          ),
          CupertinoButton(
            child: Text('Acapulco'),
            onPressed: () => _onButtonPressed(90354920, context),
          ),
          CupertinoButton(
            child: Text('Tóquio'),
            onPressed: () => _onButtonPressed(1118370, context),
          ),
          CupertinoButton(
            child: Text('Budapeste'),
            onPressed: () => _onButtonPressed(804365, context),
          ),
        ],
      ),
    );
  }
}
