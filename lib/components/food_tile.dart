import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key, 
    required this.food, 
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
    decoration:  BoxDecoration(
      color: const Color.fromARGB(255, 255, 220, 103),
      borderRadius: BorderRadius.circular(20),
       //image: const DecorationImage(image: AssetImage('food.imagePath'), fit: BoxFit.cover),
    ),
    margin: const EdgeInsets.only(bottom: 20 ,left: 90 ,right: 90),
    padding: const EdgeInsets.all(5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const SizedBox(height: 10),
        Image.asset(
          food.imagePath,
          height: 100,
        ),

        const SizedBox(height: 10),
        
        Text(
          food.name,
          style: GoogleFonts.dmSerifDisplay(fontSize: 20),
        ),
        const SizedBox(height: 10),
        
        
        ],
        
        ),
        
      ]
      ),
      
    ),
    
    );
  }
}