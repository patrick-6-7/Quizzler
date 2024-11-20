import 'package:flutter/material.dart';
import 'package:quizler/components/edit_question_dialog.dart';
import 'package:quizler/components/edit_question_tile.dart';
import 'package:quizler/question_bank/question_bank.dart';

class EditQuestionInfoPage extends StatefulWidget {

  const EditQuestionInfoPage({super.key});

  @override
  State<EditQuestionInfoPage> createState() => _EditQuestionInfoPageState();
}

class _EditQuestionInfoPageState extends State<EditQuestionInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Edit Questions'),
        elevation: 16,
        shadowColor: Colors.black,
        
        
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/p2.jpg'),
            fit: BoxFit.cover
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          itemCount: QuestionBank.questionsList.length,
          itemBuilder: (context, index){
            
            return EditQuestionTile(
              questionTxt: QuestionBank.questionsList[index].question, 
              del: () {
                setState(() {
                  QuestionBank.questionsList.removeAt(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Question deleted successfully!'),
                      duration: Duration(seconds: 2), // Optional: how long the SnackBar will be shown
                    ),
                  );
                });
              },
              edit: () async{
                await showDialog(
                  context: context,
                  builder: (context){
                    return EditQuestionDialog(question: QuestionBank.questionsList[index].question, index: index, answer: QuestionBank.questionsList[index].ans,);
                  } 
                );
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Question edited successfully!'),
                      duration: Duration(seconds: 2), // Optional: how long the SnackBar will be shown
                    ),
                  );
                });
              },
            );
          }
        ),
      )
    );
  }
}