import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   static final LatLng schoolLatlng = LatLng(
//     // Specify latitude and longitude values
//     37.540853,
//     127.078971,
//   );

//   static final CameraPosition initialPosition = CameraPosition(
//     // Camera position facing the map
//     target: schoolLatlng, // Camera location (latitude, longitude)
//     zoom: 15, // Magnification degree
//   );

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       // Use SizedBox instead of returnSizedBox
//       width: Common.getWidth,
//       child: Scaffold(
//         body: GoogleMap(
//           // Use Google Maps
//           mapType: MapType.satellite, // Set map type
//           initialCameraPosition:
//               initialPosition, // Set the initial position of the map
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static final LatLng schoolLatlng = LatLng(
    // Specify latitude and longitude values
    37.540853,
    127.078971,
  );

  static final CameraPosition initialPosition = CameraPosition(
    // Camera position facing the map
    target: schoolLatlng, // Camera location (latitude, longitude)
    zoom: 15, // Magnification degree
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700, // Set height for the Google Map
      child: GoogleMap(
        // Use Google Maps
        mapType: MapType.normal, // Set map type
        initialCameraPosition: CameraPosition(
          target: LatLng(37.540853, 127.078971), // Set initial position
          zoom: 15, // Set zoom level
        ),
      ),
    );
  }
}
