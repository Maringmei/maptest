import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maptest/polytest.dart';

void main() {
  runApp( PolyTest());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool init = true;

  List<LatLng> pLine = [
    LatLng(24.79271703223799, 93.9422892746671),
    LatLng(24.792741382154876, 93.94270501706441),
    LatLng(24.792176462852776, 93.94277743670781),
    LatLng(24.792186632027004, 93.94231885671616)
  ];
  List<LatLng> pran = [
    LatLng(24.792557362327663, 93.94089329035499),
    LatLng(24.792581712275872, 93.94118565113762),
    LatLng(24.792218897552637, 93.94083696396568),
    LatLng(24.79222863755907, 93.9412017443917)
  ];
  List<LatLng> pCustom = [];

  static const CameraPosition _kGooglePlex = CameraPosition(
    target:  LatLng(24.79271703223799, 93.9422892746671),
    zoom: 20.4746,
  );

   Set<Polygon> _polygon = HashSet<Polygon>();
   @override
  void initState() {
    // TODO: implement initState
     _polygon.add(
         Polygon(
           // given polygonId
           polygonId: PolygonId('1'),
           // initialize the list of points to display polygon
           points: pLine,
           // given color to polygon
           fillColor: Colors.green.withOpacity(0.3),
           // given border color to polygon
           strokeColor: Colors.green,
           geodesic: true,
           // given width of border
           strokeWidth: 4,
         )
     );
     setState(() {

     });
    super.initState();
  }
  MapType _currentMapType = MapType.normal;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.layers),
          onPressed: ()=>
          {
          setState(() {
          _currentMapType = (_currentMapType == MapType.normal) ? MapType.satellite : MapType.normal;
          })
        },
          heroTag: null,
        ),
        body: GoogleMap(
          mapType: _currentMapType,
          initialCameraPosition: _kGooglePlex,
          onTap: (ll){
            print(ll);

            _polygon.clear();

            pCustom.add(
             ll
            );
            _polygon.add(
                Polygon(
                  // given polygonId
                  polygonId: PolygonId('1'),
                  // initialize the list of points to display polygon
                  points: pCustom,
                  // given color to polygon
                  fillColor: Colors.green.withOpacity(0.3),
                  // given border color to polygon
                  strokeColor: Colors.green,
                  geodesic: true,
                  // given width of border
                  strokeWidth: 4,
                )
            );
            setState(() {

            });
          },
polygons: _polygon,

          ),
        ),
    );
  }
}
