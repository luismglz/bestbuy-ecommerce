import 'package:best_buy/common/constants.dart';
import 'package:best_buy/presentation/widgets/card_container.dart';
import 'package:best_buy/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.backgroundGrayColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              CardContainer(
                  child: Column(
                children: [
                  SizedBox(height: 10),
                  Text("Sign Up",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 30,
                              color: Constants.primaryColorShadow,
                              fontWeight: FontWeight.bold))),
                  SizedBox(height: 30),
                  SignupForm()
                ],
              ))
            ],
          ),
        ));
  }
}