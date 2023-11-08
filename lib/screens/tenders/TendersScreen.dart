import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TendersScreen extends StatefulWidget {
  const TendersScreen({super.key});

  @override
  State<TendersScreen> createState() => _TendersScreenState();
}

class _TendersScreenState extends State<TendersScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text('Tenders Screen')),
    );
  }
}
