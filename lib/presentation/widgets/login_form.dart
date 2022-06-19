import 'package:best_buy/common/Alert.dart';
import 'package:best_buy/common/constants.dart';
import 'package:best_buy/model/demo_element.dart';
import 'package:best_buy/model/product.dart';
import 'package:best_buy/presentation/decorations/input_decorations.dart';
import 'package:best_buy/presentation/screen/home_screen.dart';
import 'package:best_buy/presentation/screen/tabs_page.dart';
import 'package:best_buy/presentation/widgets/text_field.dart';
import 'package:best_buy/services/ProductServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({ Key? key }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final TextEditingController controllerEmailUser = TextEditingController();

  final TextEditingController controllerPasswordUser = TextEditingController();

  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }



  @override
  Widget build(BuildContext context) {
     return FutureBuilder(
        future: initializeFirebase(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Container(
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: controllerEmailUser,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration:
                              InputDecorations.addProductInputDecoration(
                                  hintText: "e.g email@gmail.com",
                                  labelText: "Email")),
                      SizedBox(height: 20),
                      TextFormField(
                          controller: controllerPasswordUser,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          decoration:
                              InputDecorations.addProductInputDecoration(
                                  hintText: "Enter your password",
                                  labelText: "Password")),
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
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                          onPressed: () async{
                            isEmptyField(controllerEmailUser)
                                ? Alert.displayMessage(
                                    context, " ", "Email is obligatory")
                                : null;
                            isEmptyField(controllerPasswordUser)
                                ? Alert.displayMessage(
                                    context, " ", "Password tag is obligatory")
                                : null;
                            if (isEmptyLoginForm(
                                controllerEmailUser, controllerPasswordUser)) {
                              Alert.displayMessage(
                                  context, "All fields are required", "Error");
                            }
                            if (!isEmptyLoginForm(
                                controllerEmailUser, controllerPasswordUser)) {
                              /*Alert.displayMessage(
                                  context, " ", "Login Successful",
                                  BackgroundColorCustom: Colors.green);*/

                      
                       User? user = await loginUsingEmailPassword(
                                email: controllerEmailUser.text,
                                password: controllerPasswordUser.text,
                                context: context);

                            if(user != null){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> TabsPage()));
                              Alert.displayMessage(
                                  context, " ", "Login Successful",
                                  BackgroundColorCustom: Colors.green);
                            }

                           
                             /* createUserWithEmailAndPassword(
                                email: controllerEmailUser.text,
                                password: controllerPasswordUser.text,
                                context: context);*/
                            }
                          })
                    ],
                  ),
                ),
              );
          }else{
            return const Center(
                child: CircularProgressIndicator(),
              );
          }
          
        });
  }



   bool isEmptyField(TextEditingController fieldController) {
    return fieldController.text.isEmpty ? true : false;
  }

  static Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password, 
    required BuildContext context})async{
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      try{
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
        user = userCredential.user;

      } on FirebaseAuthException catch (e){
        if(e.code == "user-not-found"){
          print(e.code);
           Alert.displayMessage(context, " ", "User not found",
            BackgroundColorCustom: Colors.red);
        }
      }
      return user;
    }

    static Future<User?> loginUsingEmailPassword({
      required String email,
      required String password,
      required BuildContext context,
    })async{
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      try{
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
        user = userCredential.user;
      } on FirebaseAuthException catch (e){
        switch(e.code){
          case "user-not-found":
          Alert.displayMessage(context, " ", "User not found",
              BackgroundColorCustom: Colors.red);
              break;
          case "wrong-password":
          Alert.displayMessage(context, " ", "Wrong password",
              BackgroundColorCustom: Colors.red);
          break;
        }

       /* if(user == "user-not-found"){
          print(e.code);
          print(user);
          Alert.displayMessage(context, " ", "User not found",
            BackgroundColorCustom: Colors.red);
        }*/
      }

      return user;
    }

  void onLogin(
    TextEditingController emailValue,
    TextEditingController passwordValue
  ) {

    /*var product = Product(
        title: titleValue.text,
        modelTag: modelTagValue.text,
        image: imageURLValue.text,
        brand: brandValue.text,
        price: num.parse(priceValue.text),
        category: selectedCategory,
        isPromo: isOffer);

    ProductServices().addProduct(product);

    setState(() {
     // isOnSelectedCategory = false;
     // isOnOffer = true;
    });*/
  }


  bool isEmptyLoginForm(
      TextEditingController emailValue,
      TextEditingController passwordValue) {
    if (emailValue.text.isEmpty ||
        passwordValue.text.isEmpty) {
      return true;
    }
    {
      return false;
    }
  }
}

