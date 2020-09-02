import 'package:exercicio1/invest.widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  void _onPlusButtonPressed() {
    print('teste print');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF413E65),
        title: Text(
          'Current Portfolio',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFF413E65),
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 55, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'BALANCE',
                style: TextStyle(fontSize: 15, color: Color(0x80FFFFFF)),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    '\$103,463',
                    style: TextStyle(fontSize: 34, color: Colors.white),
                  ),
                  Text(
                    '.59',
                    style: TextStyle(fontSize: 34, color: Color(0x80FFFFFF)),
                  ),
                ],
              ),
              SizedBox(
                height: 11,
              ),
              Row(
                children: [
                  Text(
                    '+28.20%',
                    style: TextStyle(fontSize: 15, color: Color(0xFF2AF598)),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'today',
                    style: TextStyle(fontSize: 15, color: Color(0x80FFFFFF)),
                  ),
                ],
              ),
              SizedBox(
                height: 37,
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Text(
                    'Your Coins',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Spacer(),
                  ButtonTheme(
                    padding: EdgeInsets.zero,
                    minWidth: 0,
                    child: FlatButton(
                      onPressed: _onPlusButtonPressed,
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Color(0xFF2AF598),
                          fontSize: 60,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              InvestWidget(
                backgroundColor: Color(0xFFF5317F),
                letter: 'B',
                sigla: 'BTC',
                name: 'Bitcoin',
                currentValue: '\$6730.49',
                valorization: '6.20',
              ),
              SizedBox(
                height: 15,
              ),
              InvestWidget(
                backgroundColor: Color(0xFF8739E5),
                letter: 'E',
                sigla: 'ETH',
                name: 'Etherium',
                currentValue: '\$490.26',
                valorization: '18.05',
              ),
              SizedBox(
                height: 15,
              ),
              InvestWidget(
                backgroundColor: Color(0xFFE56336),
                letter: 'L',
                sigla: 'LTC',
                name: 'Litecoin',
                currentValue: '\$130.31',
                valorization: '51.80',
              ),
              SizedBox(
                height: 15,
              ),
              InvestWidget(
                backgroundColor: Color(0xFF7DBD28),
                letter: 'X',
                sigla: 'XRP',
                name: 'Ripple',
                currentValue: '\$0.49',
                valorization: '819k',
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
