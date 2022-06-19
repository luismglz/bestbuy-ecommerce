import 'package:best_buy/presentation/widgets/customBottomNav.dart';
import 'package:flutter/material.dart';

class Locations extends StatelessWidget {
  const Locations({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: Row(),  
      ),
      bottomNavigationBar: CustomBottomNav(),
      
    );
  }
}