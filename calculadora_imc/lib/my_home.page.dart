import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _infoText = '';

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _refresh() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _infoText = '';
      _formKey = GlobalKey<FormState>();
    });
  }

  _calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;

    double imc = weight / (height * height);

    print(imc.toString());

    setState(() {
      if (imc < 18.6) {
        _infoText = 'Abaixo do Peso (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 18.6 && imc < 25) {
        _infoText = 'Peso ideal (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 25 && imc < 30) {
        _infoText = 'Levemento acima do peso (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 30 && imc < 35) {
        _infoText = 'Obesidade Grau 1 (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 35 && imc < 40) {
        _infoText = 'Obesidade Grau 2 (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 40) {
        _infoText = 'Obesidade Grau 3 (${imc.toStringAsPrecision(4)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calculadora de IMC'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refresh,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 100,
                      color: Colors.green,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Peso (kg)',
                          labelStyle: TextStyle(color: Colors.green)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Insira seu peso!';
                        }
                        return null;
                      },
                      controller: weightController,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Altura (cm)',
                          labelStyle: TextStyle(color: Colors.green)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Insira sua altura!';
                        }
                        return null;
                      },
                      controller: heightController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.all(0),
                      child: Container(
                        color: Colors.green,
                        width: double.infinity,
                        height: 44,
                        child: Center(
                            child: Text(
                          'Calcular',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        )),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _calculate();
                        }
                      } ,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _infoText,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
