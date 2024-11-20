import 'package:flutter/material.dart';
import 'package:quizler/question_bank/question_bank.dart';
import 'package:quizler/question_bank/questions.dart';

class EditQuestionDialog extends StatefulWidget {
  final String question;
  final int index;
  final bool answer;
  const EditQuestionDialog({
    super.key,
    required this.question,
    required this.index,
    required this.answer
  });

  @override
  State<EditQuestionDialog> createState() => _EditQuestionPopUpState();
}

class _EditQuestionPopUpState extends State<EditQuestionDialog> {
  late TextEditingController editedQuestion;
  late bool editedAnswer;

  @override
  void initState() {
    super.initState();
    // Initialize the controller and answer state here
    editedQuestion = TextEditingController(text: widget.question);
    editedAnswer = widget.answer;
  }
  @override
  Widget build(BuildContext context) {
    
    
    return AlertDialog(
      title: const Text('Edit Question'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Question'),
            controller: editedQuestion,
          ),
          Row(
            children: [
              const Text('Answer: '),
              Switch(
                value: editedAnswer,
                onChanged: (value) {
                  setState(() {
                    editedAnswer = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              QuestionBank.questionsList[widget.index] = Questions(
                question: editedQuestion.text,
                ans: editedAnswer,
              );
            });
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
