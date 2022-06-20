import 'package:best_buy/common/Alert.dart';
import 'package:best_buy/common/constants.dart';
import 'package:best_buy/presentation/screen/login.dart';
import 'package:best_buy/presentation/widgets/card_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        backgroundColor: Constants.backgroundGrayColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: CardContainer(
                    child: Column(
                  children: [
                    Text("Profile",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                          fontSize: 30,
                          color: Constants.primaryColorShadow,
                          fontWeight: FontWeight.bold,
                        ))),
                    Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Text("Email: " + user!.email!,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Constants.primaryColorShadow,
                                  fontWeight: FontWeight.bold))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: Text("ID: " + user.uid,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 250),
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          disabledColor: Colors.grey,
                          elevation: 0,
                          color: Constants.primaryColorShadow,
                          child: Container(
                              child: const Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: Text(
                              "Signup",
                              style:  TextStyle(color: Colors.white),
                            ),
                          )),
                          onPressed: () async {
                            if (user != null) {
                              await FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => Login()));
                              Alert.displayMessage(
                                  context, " ", "Successfully closed session",
                                  BackgroundColorCustom: Colors.green);
                            }
                          }),
                    )
                  ],
                )),
              )
            ],
          ),
        ));
  }
}
