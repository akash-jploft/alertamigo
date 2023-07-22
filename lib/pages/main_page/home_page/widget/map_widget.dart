import 'package:alertamigo_app/modal_helper/modal_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  BitmapDescriptor? customIcon;

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void setCustomIcon() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: .1),
      'assets/icon/person.png',
    );
    setState(() {});
  }

  @override
  void initState() {
     setCustomIcon();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  GoogleMap(
      mapToolbarEnabled:false ,
      onMapCreated: onMapCreated,
      initialCameraPosition:
      const CameraPosition(target: LatLng(26.9124, 75.7873), zoom: 10.5),
      mapType: MapType.normal,
      markers: {
        Marker(
          markerId: const MarkerId('marker_1'),
          position: const LatLng(26.7424, 75.8473),
          icon: customIcon ?? BitmapDescriptor.defaultMarker,
          onTap: () {
            ModalHelper.showCallPersonModal(context: context);
          },
        ),
      },
      myLocationEnabled: true,
      onTap: (argument) {},
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
    );
  }
}
