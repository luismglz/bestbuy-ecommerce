import 'package:best_buy/common/Alert.dart';
import 'package:best_buy/common/constants.dart';
import 'package:best_buy/presentation/screen/login.dart';
import 'package:best_buy/presentation/widgets/card_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({ Key? key }) : super(key: key);

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
                  Text("Profile",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 30,
                              color: Constants.primaryColorShadow,
                              fontWeight: FontWeight.bold))),
                  SizedBox(height: 30),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      disabledColor: Colors.grey,
                      elevation: 0,
                      color: Constants.primaryColorShadow,
                      child: Container(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        child: Text(
                          "Signup",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      onPressed: () async {
                       
                         /* User? user = await createUserWithEmailAndPassword(
                            email: controllerEmailUser.text,
                            password: controllerPasswordUser.text,
                            context: context);*/

                        User? user = FirebaseAuth.instance.currentUser;

                        if (user != null) {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Login()));
                          Alert.displayMessage(
                              context, " ", "Successfully closed session",
                              BackgroundColorCustom: Colors.green);
                        }
                        
                      })
                ],
              ))
            ],
          ),
        ));
  }
}