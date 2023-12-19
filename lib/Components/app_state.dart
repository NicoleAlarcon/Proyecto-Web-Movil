import 'package:flutter/material.dart';

class AppState extends InheritedWidget {
  final List<String> eventosInscritos;

  AppState({
    required this.eventosInscritos,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static AppState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppState>();
  }
}
