import 'package:flutter/material.dart';
import 'package:school_software/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 222, 76),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("lib/images/bg.png"), fit: BoxFit.cover)
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            "LET'S  COOKING!", style: TextStyle(
              fontSize: 40,
              color: Color.fromARGB(255, 0, 0, 0)
            ), 
            ),

           const SizedBox(height: 0),

          Padding(
            padding: const EdgeInsets.all(44.0),
            child: Image.asset('lib/images/kitchen .png'),
          ),

      

          const Text(
            "🌻เเอปพลิเคชันรวบรวมสูตรอาหารจานเดียว🌻", style: TextStyle(
              fontSize: 19,
              color: Color.fromARGB(255, 0, 0, 0),
              height: 2,
            ), 
            ),

            const SizedBox(height: 10),

             MyButton(
              text:"เริ่มทำอาหารกัน🍳",
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
              )
        ],
      ),
    ),
    );
      
  }

}