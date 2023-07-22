import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider with ChangeNotifier {
  BitmapDescriptor? customIcon;

  // void setCustomIcon() async {
  //   customIcon = await BitmapDescriptor.fromAssetImage(
  //     ImageConfiguration(devicePixelRatio: .1),
  //     'assets/icon/person.png',
  //   );
  //   notifyListeners();
  // }


}
