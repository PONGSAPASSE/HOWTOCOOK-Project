
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_software/models/favorite.dart';
import '../components/food_tile.dart';
import 'package:school_software/pages/food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

 

  void navigateToFoodDetails(int index) {

    final favorite = context.read<Favorite>();
    final foodMenu = favorite.foodMenu;

    Navigator.push(context, MaterialPageRoute(builder: (context) =>  FoodDetailsPage(
      food: foodMenu[index],
    ),
    ),
    );
  }

 

  @override
  Widget build(BuildContext context) {
    final favorite = context.read<Favorite>();
    final foodMenu = favorite.foodMenu;
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 201, 64),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("lib/images/bg.png"), fit: BoxFit.cover)
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            "🥪เมนูอาหารจานเดียววันนี้🍕", style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0)
            ), 
            ),

            const SizedBox(height: 20),

           Expanded(
            
            child: ListView.builder(
              
              itemCount: foodMenu.length,
              itemBuilder: (context, index) =>  FoodTile(food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
                
                 
                 ),
                 
           ),
           
           
          
           
          ),



        ]
        ),
        
    )
    );
  }
}