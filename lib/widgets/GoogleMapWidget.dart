import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
final double lat , lng;
  const GoogleMapWidget(this.lat, this.lng); //


  // adding a new marker to map



  @override
  Widget build(BuildContext context) {
     final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(lat, lng),
      zoom: 16,
    );// ,
    // final Completer<GoogleMapController> _controller = Completer();
    final Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
    final MarkerId markerId = MarkerId("50");
    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position:  LatLng(lat, lng),
      infoWindow: InfoWindow(title: "200", snippet: '*'),
    );
    markers[markerId] = marker;
    return Container(
      child: GoogleMap(
        buildingsEnabled: true,
        indoorViewEnabled: false,
        liteModeEnabled: false,
        mapToolbarEnabled: false,
        tiltGesturesEnabled: false,
        zoomControlsEnabled: false,
        scrollGesturesEnabled: false,
        rotateGesturesEnabled: false,
        compassEnabled: false,
        mapType: MapType.satellite,
        // myLocationButtonEnabled: true,
        initialCameraPosition: _kGooglePlex,
        // myLocationEnabled: true,
        // onMapCreated: (GoogleMapController controller) {
        //   _controller.complete(controller);
        // },
        onTap: (latLang){
        },
        markers: Set<Marker>.of(markers.values),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}