import 'dart:async';

import 'package:demo/blocs/bloc_base.dart';

class BlocCounter extends BlocBase {
  final _controller = StreamController<int>();

  StreamSink<int> get _counter => _controller.sink;

  Stream<int> get counter => _controller.stream;

  increment(int counter) {
    _counter.add(++counter);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
