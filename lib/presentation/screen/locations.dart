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

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  _onStyleLoadedCallback() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Style loaded :)"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 1),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(32.0),
          child: FloatingActionButton(
            child: Icon(Icons.swap_horiz),
            onPressed: () => setState(
              () => isLight = !isLight,
              
            ),
          ),
        ),
        body: MapboxMap(
          styleString: isLight ? MapboxStyles.LIGHT : MapboxStyles.DARK,
          accessToken: "sk.eyJ1IjoibHVpc2dsZXpsIiwiYSI6ImNsNHFtNDVpejA2MDAzYnJ6OWh4dXd1YTQifQ.B3y4MXbO1Ai8CRWmsvdp3A",
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(34.668145, 135.499907),
            zoom: 7.5),
          onStyleLoadedCallback: _onStyleLoadedCallback,
        ));

    /* Scaffold(
        backgroundColor: Constants.backgroundGrayColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              CardContainer(
                  child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text("Locations",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 30,
                              color: Constants.primaryColorShadow,
                              fontWeight: FontWeight.bold))),
                  SizedBox(height: 30),
                ],
              ))
            ],
          ),
        ));*/
  }
}
