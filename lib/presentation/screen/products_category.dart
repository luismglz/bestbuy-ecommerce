import 'package:best_buy/common/constants.dart';
import 'package:best_buy/presentation/widgets/promo_card.dart';
import 'package:best_buy/services/ProductServices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/product.dart';

class ProductsByCategory extends StatelessWidget {
  final String? category;
  ProductsByCategory({@required this.category});

  Product? product;
  ProductServices productServices = ProductServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children:[
        SizedBox(height:40),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Positioned(
              top: 50.0,
              left: 20.0,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 40,
                  color: Constants.primaryColor),
            ),
              Text(
                category!,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Constants.primaryColorShadow,
                )
                )),
            ],
          ),
        ),
        FutureBuilder(
          future: productServices.getProductsByCategory(category!),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Image.network(
                          "https://img.icons8.com/pastel-glyph/100/000000/page-not-found--v2.png"),
                    ),
                    const Text(
                      "Not data",
                      style: TextStyle(
                          fontSize: 20,
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              );
            }

            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: PromoCard(
                            product: snapshot.data[index],
                          ));
                    }),
              ),
            );
          }),
          
      ] 
    ));
  }
}
