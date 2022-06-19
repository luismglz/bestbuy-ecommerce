import 'package:best_buy/common/Alert.dart';
import 'package:best_buy/common/constants.dart';
import 'package:best_buy/model/demo_element.dart';
import 'package:best_buy/model/product.dart';
import 'package:best_buy/presentation/decorations/input_decorations.dart';
import 'package:best_buy/presentation/screen/home_screen.dart';
import 'package:best_buy/presentation/widgets/text_field.dart';
import 'package:best_buy/services/ProductServices.dart';
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

  @override
  Widget build(BuildContext context) {
     return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
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
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Constants.primaryColorShadow,
                child: Container(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
                onPressed: () {
                  isEmptyField(controllerEmailUser)
                      ? Alert.displayMessage(
                          context, " ", "Email is obligatory")
                      : null;
                  isEmptyField(controllerPasswordUser)
                      ? Alert.displayMessage(
                          context, " ", "Password tag is obligatory")
                      : null;
                  if (isEmptyLoginForm(
                          controllerEmailUser,
                          controllerPasswordUser)) {
                    Alert.displayMessage(
                        context, "All fields are required", "Error");
                  }
                  if (!isEmptyLoginForm(
                         controllerEmailUser, 
                         controllerPasswordUser)) {
                    Alert.displayMessage(context, " ", "Login Successful",
                        BackgroundColorCustom: Colors.green);

                    onLogin(
                        controllerEmailUser,
                        controllerPasswordUser);
                  }
                })
          ],
        ),
      ),
    );
  }



   bool isEmptyField(TextEditingController fieldController) {
    return fieldController.text.isEmpty ? true : false;
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