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

class AddProductForm extends StatefulWidget {
  AddProductForm({Key? key}) : super(key: key);

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final TextEditingController controllerTitleProduct = TextEditingController();

  final TextEditingController controllerModelTag = TextEditingController();

  final TextEditingController controllerProductImageURL =
      TextEditingController();

  final TextEditingController controllerProductBrand = TextEditingController();

  final TextEditingController controllerProductPrice = TextEditingController();

  String categoryDropdownValue = 'Cameras';
  bool isOnSelectedCategory = false;
  bool? isOnOffer = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
                controller: controllerTitleProduct,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecorations.addProductInputDecoration(
                    hintText: "e.g Iphone 13 Pro Max",
                    labelText: "Product Title")),
            SizedBox(height: 20),
            TextFormField(
                controller: controllerModelTag,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecorations.addProductInputDecoration(
                    hintText: "e.g A2484", labelText: "Model Tag")),
            SizedBox(height: 20),
            TextFormField(
                controller: controllerProductImageURL,
                autocorrect: false,
                keyboardType: TextInputType.url,
                decoration: InputDecorations.addProductInputDecoration(
                    hintText: "Enter image URL",
                    labelText: "Product Image URL")),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select category",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: Constants.primaryColorShadow, fontSize: 16),
                  ),
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: categoryDropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Constants.primaryColor,
                  ),
                  onChanged: (String? selectedCategory) {
                    setState(() {
                      categoryDropdownValue = selectedCategory!;
                      isOnSelectedCategory = true;
                    });
                  },
                  items: DemoElement.categoriesTitle
                      .map<DropdownMenuItem<String>>((String selectedCategory) {
                    return DropdownMenuItem<String>(
                      value: selectedCategory,
                      child: Text(selectedCategory),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: DemoElement.isInOffer.keys.map((String key) {
                return CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: Constants.primaryColorShadow,
                  title: Text(key,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Constants.primaryColorShadow, fontSize: 16),
                      )),
                  value: DemoElement.isInOffer[key],
                  onChanged: (bool? isInOfferSelected) {
                    setState(() {
                      DemoElement.isInOffer[key] = isInOfferSelected!;
                      isOnOffer = DemoElement.isInOffer[key];
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextFormField(
                controller: controllerProductBrand,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecorations.addProductInputDecoration(
                    hintText: "e.g Apple", labelText: "Brand")),
            SizedBox(height: 20),
            TextFormField(
                controller: controllerProductPrice,
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: InputDecorations.addProductInputDecoration(
                    hintText: "e.g 1700.0",
                    labelText: "Price",
                    prefixIcon: Icons.attach_money_sharp,
                    iconColor: Constants.primaryColor)),
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
                    "Add Product",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
                onPressed: () {
                  isEmptyField(controllerTitleProduct)
                      ? Alert.displayMessage(
                          context, " ", "Title product is obligatory")
                      : null;
                  isEmptyField(controllerModelTag)
                      ? Alert.displayMessage(
                          context, " ", "Model tag is obligatory")
                      : null;
                  isEmptyField(controllerProductImageURL)
                      ? Alert.displayMessage(
                          context, " ", "URL image is obligatory")
                      : null;
                  isEmptyField(controllerProductBrand)
                      ? Alert.displayMessage(
                          context, " ", "Brand is obligatory")
                      : null;
                  isEmptyField(controllerProductPrice)
                      ? Alert.displayMessage(
                          context, " ", "Price is obligatory")
                      : null;
                  isOnSelectedCategory == false
                      ? Alert.displayMessage(
                          context, " ", "Category is obligatory")
                      : null;
                  if (isEmptyForm(
                          controllerTitleProduct,
                          controllerModelTag,
                          controllerProductImageURL,
                          controllerProductBrand,
                          controllerProductPrice,
                          isOnSelectedCategory) &&
                      isOnSelectedCategory == false) {
                    Alert.displayMessage(
                        context, "All fields are required", "Error");
                  }
                  if (!isEmptyForm(
                          controllerTitleProduct,
                          controllerModelTag,
                          controllerProductImageURL,
                          controllerProductBrand,
                          controllerProductPrice,
                          isOnSelectedCategory) &&
                      isOnSelectedCategory == true) {
                    Alert.displayMessage(context, " ", "Product Added",
                        BackgroundColorCustom: Colors.green);

                    addProduct(
                        controllerTitleProduct,
                        controllerModelTag,
                        controllerProductImageURL,
                        controllerProductBrand,
                        controllerProductPrice,
                        categoryDropdownValue,
                        isOnOffer);
                  }
                })
          ],
        ),
      ),
    );
  }

  bool isEmptyForm(
      TextEditingController titleValue,
      TextEditingController modelTagValue,
      TextEditingController imageURLValue,
      TextEditingController brandValue,
      TextEditingController priceValue,
      bool isSelectedCategory) {
    if (titleValue.text.isEmpty ||
        modelTagValue.text.isEmpty ||
        imageURLValue.text.isEmpty ||
        brandValue.text.isEmpty ||
        priceValue.text.isEmpty ||
        isSelectedCategory == false) {
      return true;
    }
    {
      return false;
    }
  }

  bool isEmptyField(TextEditingController fieldController) {
    return fieldController.text.isEmpty ? true : false;
  }

  void addProduct(
    TextEditingController titleValue,
    TextEditingController modelTagValue,
    TextEditingController imageURLValue,
    TextEditingController brandValue,
    TextEditingController priceValue,
    String selectedCategory,
    bool? isInOfferSelected,
  ) {
    int isOffer;
    if (isInOfferSelected!) {
      isOffer = 1;
    } else {
      isOffer = 0;
    }

    var product = Product(
        title: titleValue.text,
        modelTag: modelTagValue.text,
        image: imageURLValue.text,
        brand: brandValue.text,
        price: num.parse(priceValue.text),
        category: selectedCategory,
        isPromo: isOffer);

    ProductServices().addProduct(product);

    setState(() {
      isOnSelectedCategory = false;
      isOnOffer = true;
    });
  }
}
