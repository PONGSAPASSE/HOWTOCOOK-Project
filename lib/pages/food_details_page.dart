
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_software/components/button.dart';
import 'package:school_software/models/favorite.dart';
import 'package:school_software/models/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({super.key, required this.food});


  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {

  void addToFav () {
    final favorite = context.read<Favorite>();

    favorite.addToFav(widget.food);

    showDialog(context: context,
     builder: (context) => AlertDialog(
      content: const Text("เพิ่มเมนูลงในรายการโปรดเเล้ว!"),
      actions: [
        IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.done,
        color: Color.fromARGB(255, 151, 119, 36),))
      ],
     ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        color: const Color.fromARGB(255, 255, 201, 64),
        animationDuration: const Duration(milliseconds: 300),

        items:  [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/menupage');
          },
          icon: const Icon(Icons.home),),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/favpage');
          },
          icon: const Icon(Icons.favorite),),
       
      ]),
      
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 201, 64),
        ),
      
       body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("lib/images/bg.png"), fit: BoxFit.cover)
        ), 
      
        
        child:  Column(
          
          children: [
            Expanded(child: ListView(
              children: [
                Image.asset(
                  widget.food.imagePath,
                  height:200,
                ),


                
                const SizedBox(height: 25),

                 Row(
                  
                  children: [
                    const SizedBox(width: 50,),

                    Text(
                      widget.food.name,
                      style: GoogleFonts.dmSerifDisplay(fontSize: 28)
                      
                      
                    ),
                  ],
                 ),
                    const SizedBox(height: 25,),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text("ส่วนผสม 🍳", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ), 
                    ),
                    ),

                    const SizedBox(height: 25,),

                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                      widget.food.recipes,
                      style: GoogleFonts.dmSerifDisplay(
                        fontWeight: FontWeight.bold,
                        fontSize: 15)
                      ), 
                    ),

                    const SizedBox(height: 25,),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text("วิธีทำอาหาร 🍽️", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ), 
                    ),
                    ),

                    const SizedBox(height: 25,),

                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                      widget.food.howto,                      
                      style: GoogleFonts.dmSerifDisplay(
                        fontWeight: FontWeight.bold,
                        fontSize: 15)
                      ), 
                    ),

                    const SizedBox(height: 25,),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text("วิดีโอตัวอย่างการทำอาหาร▶️ ", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ), 
                    ),
                    ),

                    const SizedBox(height: 25,),

                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                      widget.food.linkclip,
                      style: GoogleFonts.dmSerifDisplay(
                        fontWeight: FontWeight.bold,
                        fontSize: 15)
                      ), 
                    ),

                    const SizedBox(height: 50,),  
                  
              ],
            ),
            ),

            Container(
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(children: [
                MyButton(text: "เพิ่มไว้ในเมนูโปรด", onTap: addToFav),

              ],),
            )
          ],
          ),
        ),
      );
      
    
    
      
  }
}