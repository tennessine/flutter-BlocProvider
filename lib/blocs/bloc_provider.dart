import 'package:demo/blocs/bloc_base.dart';
import 'package:flutter/material.dart';

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  final Widget child;
  final List<T> blocs;

  BlocProvider({
    Key key,
    @required this.child,
    @required this.blocs,
  }) : super(key: key);

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static List<T> of<T extends BlocBase>(BuildContext context) {
    _BlocProviderInherited provider =
        context.findAncestorWidgetOfExactType<_BlocProviderInherited<T>>();
    return provider?.blocs;
  }
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider> {
  @override
  void dispose() {
    widget.blocs.forEach((bloc) {
      bloc.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited<T>(
      blocs: widget.blocs,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  final List<T> blocs;

  _BlocProviderInherited({
    Key key,
    @required Widget child,
    @required this.blocs,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
