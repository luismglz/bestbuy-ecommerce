import 'dart:ffi';

import 'package:best_buy/common/Alert.dart';
import 'package:best_buy/common/constants.dart';
import 'package:best_buy/presentation/widgets/card_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class Locations extends StatefulWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  MapboxMapController? mapController;
  var isLight = true;

  var lightMap = "mapbox://styles/luisglezl/cl4rmbedo001815qoje6mlr27";
  var darkMap = "mapbox://styles/luisglezl/cl4rmjg86003214o9qivbwreh";

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  _onStyleLoadedCallback() {
    isLight
        ? Alert.displaySmallMessage(context, "Light Mode ☀️",
            BackgroundColorCustom: Constants.primaryColor)
        : Alert.displaySmallMessage(context, "Dark Mode 🌙",
            BackgroundColorCustom: Constants.primaryColorShadow);
  }

  final initPosition = LatLng(34.668145, 135.499907);
  LatLng center = LatLng(19.3936, -99.1704);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: FloatingActionButton(
              backgroundColor: Constants.primaryColorShadow,
              child: Icon(Icons.my_location),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: FloatingActionButton(
              backgroundColor: Constants.primaryColor,
              child: isLight ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
              onPressed: () => setState(
                () => isLight = !isLight,
              ),
            ),
          ),
        ]),
        body: MapboxMap(
          styleString: isLight ? lightMap : darkMap,
          accessToken:
              "sk.eyJ1IjoibHVpc2dsZXpsIiwiYSI6ImNsNHFtNDVpejA2MDAzYnJ6OWh4dXd1YTQifQ.B3y4MXbO1Ai8CRWmsvdp3A",
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: center, zoom: 14.0),
          onStyleLoadedCallback: _onStyleLoadedCallback,
        ));
  }
}
