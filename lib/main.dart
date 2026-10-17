import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(const CinetecaApp());
}

class CinetecaApp extends StatelessWidget {
  const CinetecaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cineteca',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const Scaffold(body: Center(child: Text('Cineteca'))),
    );
  }
}
