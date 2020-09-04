import 'dart:async';

import 'package:dog/debouncer.utils.dart';
import 'package:dog/models/breed.model.dart';
import 'package:dog/network/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchDogPage extends StatefulWidget {
  @override
  _SearchDogPageState createState() => _SearchDogPageState();
}

class _SearchDogPageState extends State<SearchDogPage> {
  Breed _breed;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _inputController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 1000);

  _getData() async {
    _breed = await Api.retrieveDogBreed(_inputController.text);
    if (_breed.status == 'success') FocusScope.of(context).unfocus();
    setState(() {});
  }

  Widget renderImage() {
    return Column(
      children: [
        SizedBox(height: 50),
        SizedBox(
            height: 300,
            child: _breed.status == 'error'
                ? Image.asset('assets/images/viralata.jpeg')
                : Image.network(_breed.image)),
        SizedBox(height: 50),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue,
          ),
          child: CupertinoButton(
            onPressed: _getData,
            child: Text(
              'Another one',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        )
      ],
    );
  }

  _onTextChange(String text) {
    _debouncer.run(() => _getData());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Type the breed you want to see:'),
            TextFormField(
              onChanged: _onTextChange,
              controller: _inputController,
            ),
            _breed == null ? Container() : renderImage(),
          ],
        ),
      ),
    );
  }
}
