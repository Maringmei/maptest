import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolyMap extends StatefulWidget {
  const PolyMap({Key? key}) : super(key: key);

  @override
  State<PolyMap> createState() => _PolyMapState();
}

class _PolyMapState extends State<PolyMap> {
  List<LatLng> pFirst = [
    LatLng(24.792646827874787, 93.94226306724539),
    LatLng(24.792651697861288, 93.94261845993987),
    LatLng(24.792416720794222, 93.94261577773085),
    LatLng(24.79242889578271, 93.94225367951384)
  ];

  List<LatLng> pClick = [];
  List<LatLng> pClickNew = [];

  MapType _currentMapType = MapType.normal;
  Set<Polygon> _polygon = HashSet<Polygon>();
  int drawIndex = 0;

  //map list
  List mapList = [
    {
      "polyLines": [
        {
          "id": 0,
          "name": "nielit",
          "description": "nielit imphal",
          "latlng": <LatLng>[
          ]
        },
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: (){
                setState(() {
                  // pClick.removeLast();
                  mapList[0]["polyLines"]![drawIndex]["latlng"].removeLast();

                  setState(() {});
                });
              }, icon: Icon(Icons.undo)),
              IconButton(onPressed: (){
                drawIndex++;
                mapList[0]["polyLines"].add( {
                  "id": drawIndex,
                  "name": "122",
                  "description": "sdf rt",
                  "latlng": <LatLng>[
                  ]
                });
              }, icon: Icon(Icons.add)),
              IconButton(onPressed: (){
                setState(() {
                  _currentMapType = (_currentMapType == MapType.normal)
                      ? MapType.hybrid
                      : MapType.normal;
                });
              }, icon: Icon(Icons.layers)),
            ],
          ),

          body: GoogleMap(
            mapType: _currentMapType,
            initialCameraPosition: CameraPosition(
                zoom: 20.00,
                target: LatLng(24.792646827874787, 93.94226306724539)),
            onTap: (latlng) {
              mapList[0]["polyLines"]![drawIndex]["latlng"].add(latlng);
              _polygon.add(Polygon(
                // given polygonId
                polygonId: PolygonId("$drawIndex"),
                // initialize the list of points to display polygon
                points: mapList[0]["polyLines"]![drawIndex]["latlng"],
                // given color to polygon
                fillColor: Colors.red.withOpacity(0.3),
                // given border color to polygon
                strokeColor: Colors.green,
                geodesic: true,
                // given width of border
                strokeWidth: 4,
              ));
              setState(() {

              });

              print(latlng);
            },
            polygons: _polygon,
            compassEnabled: true,
          )),
    );
  }
}
