import 'package:flutter/material.dart';
import 'package:quizler/buttons/ans_button.dart';
import 'package:quizler/pages/score_page.dart';
import 'package:quizler/question.dart/questions.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  
  int questionNumber = 0;
  final List<Questions> questionsList = [
  Questions(question: "Flutter uses Dart as its programming language ?", ans: true),
  Questions(question: "Flutter apps run natively on both iOS and Android without the need for platform-specific code ?", ans: true),
  Questions(question: "In Flutter, the widget tree defines the user interface structure of an app ?", ans: true),
  Questions(question: "Flutter does not support state management techniques like Provider or Bloc ?", ans: false),
  Questions(question: "Hot reload in Flutter helps to instantly apply code changes without restarting the entire app ?", ans: true),
  Questions(question: "Flutter can only be used to develop mobile applications and does not support web or desktop applications ?", ans: false),
  ];
  int score = 0;
  List<Icon> stat = [];

  void set(bool ans){
    setState(() {
      if(questionsList[questionNumber].ans == ans){
        score++;
        stat.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          )
        );
      }
      else{
        stat.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          )
        );
      }
      questionNumber++;
      if(questionNumber == questionsList.length){
        questionNumber--;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ScorePage(score: score,);
            }
          )
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/p2.jpg',
            ),
          fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
        
                //------------------------------------------------------------------------------------Display score
                const SizedBox(height: 10,),
                SafeArea(
                  child: Text(
                    'Score $score',
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
        
                
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
        
                      //-----------------------------------------------------------------------------Display question
                      Text(
                        questionsList[questionNumber].question,
                        style: const TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ],
                  )
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
        
                    //-------------------------------------------------------------------------------True button
                    AnsButton(color: Colors.green, txt: 'True', onPressed: (){
                      set(true);
                    }),
                    const SizedBox(height: 10,),
        
                    //-------------------------------------------------------------------------------false button
                    AnsButton(color: Colors.red, txt: 'False', onPressed: (){
                      set(false);
                    }),
        
                    const SizedBox(height: 10,),
                    Row(
                      //-------------------------------------------------------------------------------answer stats
                      children: [
                        const Icon(
                          Icons.abc,
                          color: Color.fromARGB(255, 111, 12, 187),
                        ),
                        ...stat,
                      ],
                    ),
                    const SizedBox(height: 10,)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}