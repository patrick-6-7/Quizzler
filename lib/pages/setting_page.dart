import 'package:flutter/material.dart';
import 'package:quizler/pages/add_question_page.dart';
import 'package:quizler/pages/new_edit_page.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add Question'),
            onTap: () {
              // Navigate to Add Question screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddQuestionPage()),
              );
            },
          ),
          const Divider(), // Optional, to add separation between list items
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Questions'),
            onTap: () {
              // Navigate to Edit Questions screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditQuestionInfoPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}