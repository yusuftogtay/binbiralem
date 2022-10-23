import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  // ViewModel
  final T viewModel;
  final Function(T model) onViewModelReady;

  // All LifeCycle
  final VoidCallback? onCreateState;
  final VoidCallback? onInitState;
  final VoidCallback? onDidChangeDependencies;
  final Widget Function(BuildContext context, T value) onBuild;
  final VoidCallback? onDidUpdateWidget;
  final VoidCallback? onDeactivate;
  final VoidCallback? onDispose;

  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onViewModelReady,
    required this.onBuild,
    this.onCreateState,
    this.onInitState,
    this.onDidChangeDependencies,
    this.onDidUpdateWidget,
    this.onDeactivate,
    this.onDispose,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() {
    // Create State
    if (onCreateState != null) onCreateState!();
    return _BaseViewState<T>();
  }
}

class _BaseViewState<T> extends State<BaseView<T>> {
  // ViewModel
  late T viewModel;

  // Init State
  @override
  void initState() {
    viewModel = widget.viewModel;
    widget.onViewModelReady(viewModel);
    if (widget.onInitState != null) widget.onInitState!();
    super.initState();
  }

  // Did Change Dependencies State
  @override
  void didChangeDependencies() {
    if (widget.onDidChangeDependencies != null) {
      widget.onDidChangeDependencies!();
    }
    super.didChangeDependencies();
  }

  // Build State
  @override
  Widget build(BuildContext context) {
    return widget.onBuild(context, viewModel);
  }

  // Did Update Widget State
  @override
  void didUpdateWidget(covariant BaseView<T> oldWidget) {
    if (widget.onDidUpdateWidget != null) widget.onDidUpdateWidget!();
    super.didUpdateWidget(oldWidget);
  }

  // Deactivate State
  @override
  void deactivate() {
    if (widget.onDeactivate != null) widget.onDeactivate!();
    super.deactivate();
  }

  // Dispose State
  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }
}
