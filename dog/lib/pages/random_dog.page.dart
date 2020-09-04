import 'package:dog/models/breed.model.dart';
import 'package:dog/network/api.dart';
import 'package:flutter/material.dart';

class RandomDogPage extends StatefulWidget {
  @override
  _RandomDogState createState() => _RandomDogState();
}

class _RandomDogState extends State<RandomDogPage> {
  Breed _breed;

  _getData() async {
    _breed = await Api.retrieveRandomDogBreed();
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return _breed == null
        ? CircularProgressIndicator()
        : Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
              child: Image.network(_breed.image),
            ),
        );
  }
}
