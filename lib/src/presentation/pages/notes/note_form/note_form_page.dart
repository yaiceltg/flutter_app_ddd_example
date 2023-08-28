import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NoteFormPage extends StatelessWidget {
  const NoteFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Note Form Page',
        ),
      ),
      body: const Center(
        child: Text(
          'Note Form Page',
        ),
      ),
    );
  }
}
