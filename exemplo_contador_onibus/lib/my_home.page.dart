import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  int numberOfPeopleInsideTheBus = 2;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onIncreased() {
    setState(() {
      numberOfPeopleInsideTheBus++;
    });
  }

  _onDecreased() {
    setState(() {
      numberOfPeopleInsideTheBus--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador de pessoas'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Numero de pessoas no ônibus',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            numberOfPeopleInsideTheBus.toString(),
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: _onIncreased,
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 44),
                ),
              ),
              CupertinoButton(
                onPressed: _onDecreased,
                child: Text(
                  '-',
                  style: TextStyle(fontSize: 44),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
