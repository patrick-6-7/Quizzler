import 'package:flutter/material.dart';
import 'package:quizler/buttons/startbutton.dart';
import 'package:quizler/pages/setting_page.dart';
import 'package:quizler/pages/quizz_page.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    void startQuiz(){
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const QuizzPage();
          }
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 64, 35, 143),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF6C63FF)
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SettingsPage();
                    }
                  )
                );
              },
            ),
            // Add more list tiles here
          ],
        ),
      ),
      backgroundColor: const Color(0xFF1F1147),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
              const Text(
                'Q u i z l e r',
                style: TextStyle(
                  fontFamily: 'DM_Sans',
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
        
              const SizedBox(height: 40,),
        
              SizedBox(
                width: size.width, // Use the full screen width
                child: Image.asset('assets/logo.png'),
              ),
        
              const SizedBox(height: 30),
        
              StartButton(txt: 'Play Now', onPressed: () {
                startQuiz();
              })
            ],
          ),
        ),
      ),
    );
  }
}
