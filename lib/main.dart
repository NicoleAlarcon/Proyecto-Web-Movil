import 'package:app_reconciliacion/Components/app_state.dart';
import 'package:app_reconciliacion/Components/colors.dart';
import 'package:app_reconciliacion/Views/auth.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const AppStateWidget(
      child: MyApp(),
    ),
  );
}

class AppStateWidget extends StatefulWidget {
  final Widget child;

  const AppStateWidget({required this.child});

  @override
  _AppStateWidgetState createState() => _AppStateWidgetState();

  static AppStateWidget? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<AppStateWidget>();
  }
}

class _AppStateWidgetState extends State<AppStateWidget> {
  List<String> eventosInscritos = [];

  @override
  Widget build(BuildContext context) {
    return AppState(
      eventosInscritos: eventosInscritos,
      child: widget.child,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}
