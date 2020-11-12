import 'dart:async';

import 'package:demo/blocs/bloc_provider.dart';
import 'package:flutter/material.dart';

import 'blocs/bloc_counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        child: MyHomePage(),
        blocs: [BlocCounter()],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    BlocProvider.of<BlocCounter>(context).first.counter.listen((_count) {
      setState(() {
        _counter = _count;
      });
    });
    super.initState();
  }

  _incrementCounter() {
    BlocProvider.of<BlocCounter>(context).first.increment(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: Center(
        child: Text('$_counter'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _incrementCounter,
      ),
    );
  }
}
