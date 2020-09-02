import 'dart:io';

import 'package:exemplo5/models/category.model.dart';
import 'package:exemplo5/network/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category.drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> _categories = <Category>[];
  Category _defaultCategory;
  Category _currentCategory;
  List<DropdownMenuItem> _unitMenuItems = <DropdownMenuItem>[];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _inputController = TextEditingController();
  TextEditingController _outputController = TextEditingController();
  int _inputDropDownValue = 0;
  int _outputDropDownValue = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _getData();
  }

  _getData() async {
    await Future.delayed(Duration(seconds: 5));
    _categories = await Api.retrieveLocalCategories(context);
    _defaultCategory = _categories.first;
    _currentCategory = _defaultCategory;
    _populateDropDown();
    setState(() {});
  }

  _populateDropDown() {
    _unitMenuItems = <DropdownMenuItem>[];
    int index = 0;
    _currentCategory.units.forEach((element) {
      _unitMenuItems.add(
        DropdownMenuItem(
          value: index,
          child: Text(element.name),
        ),
      );
      index++;
    });
  }

  _categorySelected(int position) {
    setState(() {
      _currentCategory = _categories[position];
      _inputDropDownValue = 0;
      _outputDropDownValue = 1;
      _outputController.text = '';
      _inputController.text = '';
      _populateDropDown();
    });
  }

  _convert() {
    final double input = double.parse(_inputController.text);
    final double output = input *
        _currentCategory.units[_outputDropDownValue].conversion /
        _currentCategory.units[_inputDropDownValue].conversion;

    _outputController.text = output.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _categories.isEmpty
        ? Container(
            child: Center(
              child: Platform.isAndroid
                  ? CircularProgressIndicator()
                  : CupertinoActivityIndicator(
                      radius: 15,
                    ),
            ),
            color: Colors.white,
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: _currentCategory.color,
              title: Text('Conversor'),
            ),
            drawer: CategoryDrawer(
              categories: _categories,
              backgroundColor: _currentCategory.color,
              onTap: _categorySelected,
            ),
            body: Container(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _inputController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Input',
                          labelStyle: TextStyle(fontSize: 26),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DropdownButton(
                          items: _unitMenuItems,
                          onChanged: (value) {
                            setState(() {
                              _inputDropDownValue = value;
                            });
                          },
                          value: _inputDropDownValue,
                        ),
                      ),
                      Icon(
                        Icons.compare_arrows,
                        size: 40,
                      ),
                      TextFormField(
                        controller: _outputController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Output',
                          labelStyle: TextStyle(fontSize: 26),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DropdownButton(
                          items: _unitMenuItems ?? [],
                          onChanged: (value) {
                            setState(() {
                              _outputDropDownValue = value;
                            });
                          },
                          value: _outputDropDownValue,
                        ),
                      ),
                      CupertinoButton(
                        onPressed: _convert,
                        child: Text(
                          'Converter',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: _currentCategory.color),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
