import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 10,),
          CustomCardType2(name: 'Un hermoso paisaje', imageUrl: 'https://www.lukas-petereit.com/wp-content/uploads/2017/10/Rakotzbr%C3%BCcke-Bridge-Rakotz-Kromlau-Lake-Sun-Sunrise-Landscape-Reflection-Germany-Saxony-Travel-Photography-Nature-Photo-Spreewald-2.jpg',),
          SizedBox(height: 20,),
          CustomCardType2(imageUrl: 'https://assets.tommackie.com/wp-content/uploads/2021/05/25133414/170495-2.jpg',),
          SizedBox(height: 20,),
          CustomCardType2(imageUrl: 'https://photographylife.com/wp-content/uploads/2017/01/Difficult-landscape-photo-to-take.jpg',),
          SizedBox(height: 100,),
        ],
      )
    );
  }
}