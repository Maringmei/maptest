import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maptest/polymap.dart';
import 'package:maptest/polytest.dart';

void main() {
  bool _useGoogleMap = true;
  runApp(_useGoogleMap ? PolyMap() : PolyTest());
}

