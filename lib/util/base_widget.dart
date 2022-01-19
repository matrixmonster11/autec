import 'package:autec/util/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    T viewModel,
    Widget child,
  ) builder;

  final Function(T model)? onModelReady;
  final Function(T)? onDispose;
  final T viewModel;

  BaseWidget({
    required this.builder,
    required this.viewModel,
    this.onModelReady,
    this.onDispose,
  });

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseViewModel> extends State<BaseWidget<T>> {

  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) widget.onModelReady!(widget.viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => widget.viewModel,
      child: Consumer<T>(
        builder: (context, viewModel, child) {
          return widget.builder(
            context,
            viewModel,
            child ?? Container(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose!(widget.viewModel);
    super.dispose();
  }
}
