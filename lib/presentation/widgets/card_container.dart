import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({required this.child, Key? key }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        height: 750,
        decoration: _createCardShape(),
        child: this.child,
      ),
    );
  }


  BoxDecoration _createCardShape()=> BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    
    boxShadow: [
      BoxShadow(
      color: Colors.black12,
      blurRadius: 15,
      offset: Offset(0,5)
    )
    ]
  );
}