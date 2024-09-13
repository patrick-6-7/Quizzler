import 'package:flutter/material.dart';
import 'package:quizler/buttons/startbutton.dart';
import 'package:quizler/pages/quizz_page.dart';
import 'package:quizler/screens/start_screen.dart';

class ScorePage extends StatelessWidget {
  final int score;
  const ScorePage({
    super.key,
    required this.score
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/p2.jpg'
            ),
            fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: cro,
            children: [
              Text(
                'Your Score: $score',
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'DM_Sans',
                  fontWeight: FontWeight.w900,
                  fontSize: 20
                ),
              ),
        
              const SizedBox(height: 180,),
        
              StartButton(
                txt: 'Restart Quizz',
                onPressed: (){
                  Navigator.pop;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizzPage()
                    )
                  );
                }
              ),
        
              const SizedBox(height: 20,),
        
              StartButton(
                txt: 'Home page',
                onPressed: (){
                  Navigator.pop;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StartScreen()
                    )
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}