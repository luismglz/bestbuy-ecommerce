import 'package:best_buy/common/Alert.dart';
import 'package:best_buy/common/constants.dart';
import 'package:best_buy/model/demo_element.dart';
import 'package:best_buy/model/product.dart';
import 'package:best_buy/presentation/decorations/input_decorations.dart';
import 'package:best_buy/presentation/screen/home_screen.dart';
import 'package:best_buy/presentation/screen/login.dart';
import 'package:best_buy/presentation/screen/tabs_page.dart';
import 'package:best_buy/presentation/widgets/text_field.dart';
import 'package:best_buy/services/ProductServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController controllerEmailUser = TextEditingController();

  final TextEditingController controllerPasswordUser = TextEditingController();

  final TextEditingController controllerConfirmPasswordUser =
      TextEditingController();

  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                        controller: controllerEmailUser,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecorations.addProductInputDecoration(
                            hintText: "e.g email@gmail.com",
                            labelText: "Email")),
                    SizedBox(height: 20),
                    TextFormField(
                        controller: controllerPasswordUser,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecorations.addProductInputDecoration(
                            hintText: "Enter your password",
                            labelText: "Password")),
                    SizedBox(height: 20),
                    TextFormField(
                        controller: controllerConfirmPasswordUser,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecorations.addProductInputDecoration(
                            hintText: "Enter your password",
                            labelText: "Confirm password")),
                    SizedBox(height: 20),
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
                          isEmptyField(controllerEmailUser)
                              ? Alert.displayMessage(
                                  context, " ", "Email is obligatory")
                              : null;
                          isEmptyField(controllerPasswordUser)
                              ? Alert.displayMessage(
                                  context, " ", "Password tag is obligatory")
                              : null;
                          if (isEmptySignupForm(
                              controllerEmailUser,
                              controllerPasswordUser,
                              controllerConfirmPasswordUser)) {
                            Alert.displayMessage(
                                context, "All fields are required", "Error");
                          }

                          if (!isEqualPassword(controllerPasswordUser,
                              controllerConfirmPasswordUser)) {
                            Alert.displayMessage(
                                context, " ", "Password does not match",
                                BackgroundColorCustom: Colors.red);
                          } else {
                            if (!isEmptySignupForm(
                                controllerEmailUser,
                                controllerPasswordUser,
                                controllerConfirmPasswordUser)) {
                              User? user = await createUserWithEmailAndPassword(
                                  email: controllerEmailUser.text,
                                  password: controllerPasswordUser.text,
                                  context: context);

                              if (user != null) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                                Alert.displayMessage(context, " ",
                                    "Successfully created account",
                                    BackgroundColorCustom: Colors.green);
                              }
                            }
                          }
                        }),
                    SizedBox(height: 60),
                    Text("Does have an account?"),
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        disabledColor: Colors.grey,
                        elevation: 0,
                        color: Colors.transparent,
                        child: Container(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Constants.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                        onPressed: () async {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Login()));
                        })
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  bool isEmptyField(TextEditingController fieldController) {
    return fieldController.text.isEmpty ? true : false;
  }

  static Future<User?> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Alert.displayMessage(context, " ", "The password provided is too weak.",
            BackgroundColorCustom: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Alert.displayMessage(
            context, " ", "The account already exists for that email.",
            BackgroundColorCustom: Colors.red);
      }
    }
    return user;
  }

  bool isEmptySignupForm(
    TextEditingController emailValue,
    TextEditingController passwordValue,
    TextEditingController confirmPasswordValue,
  ) {
    if (emailValue.text.isEmpty ||
        passwordValue.text.isEmpty ||
        confirmPasswordValue.text.isEmpty) {
      return true;
    }
    {
      return false;
    }
  }

  bool isEqualPassword(TextEditingController passwordValue,
      TextEditingController confirmPasswordValue) {
    return passwordValue.text == confirmPasswordValue.text ? true : false;
  }
}
