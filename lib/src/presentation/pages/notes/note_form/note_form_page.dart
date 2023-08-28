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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.save,
            ),
            tooltip: 'Save Note',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          child: Form(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Short title',
                    labelText: 'Title',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  maxLines: 6,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Write your note content here',
                    labelText: 'Description',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
