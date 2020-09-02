import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CloseButton(),
          title: Text('Postcard'),
        ),
        body: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFFFC3875),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recipient',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        'Amelie N Mason',
                        style:
                            TextStyle(fontSize: 20, color: Color(0x50000000)),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFFFCAB55),
                    ),
                    child: Icon(
                      Icons.business,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          '47 Greyfriars Road, CAPHEATON\n'
                          'United Kingdom\n'
                          'NE19 5PJ',
                          style:
                              TextStyle(fontSize: 20, color: Color(0x50000000)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFF22C0FC),
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Message',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris dictum tellus in nunc ornare, sit amet malesuada magna convallis. Fusce bibendum, diam in sagittis convallis, turpis nisi varius nisl, vitae sodales turpis nunc eget mi. Integer lobortis pharetra dui non lacinia. In vitae nisl eget mauris pretium condimentum. Nulla tellus elit, accumsan sit amet erat eu, gravida faucibus ipsum. Aliquam aliquet orci id purus tempor, vel rhoncus justo gravida.',
                          style:
                              TextStyle(fontSize: 20, color: Color(0x50000000)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {},
                        textColor: Colors.white,
                        color: Color(0xFF767676),
                        child: Text('SAVE DRAFT',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    flex: 1,
                    child: ButtonTheme(
                        minWidth: double.infinity,
                        height: 50,
                        child: RaisedButton(
                          onPressed: () {},
                          textColor: Colors.white,
                          color: Color(0xFFFC3875),
                          child: Text(
                            'REVIEW DESIGN',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
