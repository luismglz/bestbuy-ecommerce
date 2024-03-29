import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({required this.child, Key? key, this.height}) : super(key: key);

  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        height: height ?? 700,
        decoration: _createCardShape(),
        child: this.child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 15, offset: Offset(0, 5))
          ]);
}
