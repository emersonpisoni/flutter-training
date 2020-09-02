import 'package:flutter/cupertino.dart';

class Unit {
  final String name;
  final double conversion;

  Unit({@required this.name, @required this.conversion})
      : assert(name != null),
        assert(conversion != null);

  Unit.fromJson(Map jsonMap)
      : assert(jsonMap['name'] != null),
        assert(jsonMap['conversion'] != null),
        name = jsonMap['name'],
        conversion = jsonMap['conversion'].toDouble();

  Unit fromJson(Map jsonMap) {
    return Unit(name: jsonMap['name'], conversion: jsonMap['conversion']);
  }
}
