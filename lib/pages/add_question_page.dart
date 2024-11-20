import 'package:flutter/material.dart';
import 'package:quizler/buttons/startbutton.dart';
import 'package:quizler/question_bank/question_bank.dart';

class AddQuestionPage extends StatefulWidget {
  const AddQuestionPage({super.key});

  @override
  State<AddQuestionPage> createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  final TextEditingController _questionController = TextEditingController();
  bool? _answer = true; // Default answer is true

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C63FF),
        title: const Text(
          'Add Question',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 18,
        shadowColor: Colors.black,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your question:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _questionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type your question here...',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select the answer:',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('True'),
                    leading: Radio<bool>(
                      value: true,
                      groupValue: _answer,
                      onChanged: (bool? value) {
                        setState(() {
                          _answer = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('False'),
                    leading: Radio<bool>(
                      value: false,
                      groupValue: _answer,
                      onChanged: (bool? value) {
                        setState(() {
                          _answer = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: StartButton(txt: 'Save Question', onPressed: () {
                QuestionBank.addToList(_questionController.text, _answer!);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('Question added successfully!'),
                    duration: Duration(seconds: 2), // Optional: how long the SnackBar will be shown
                  ),
                );
                Navigator.pop(context);

              })
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }
}
