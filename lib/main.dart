import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children:[
          FlutterMap(
        options:MapOptions(
        center: LatLng(30 , 40),
        zoom: 3.2,
    ),
        children: [
          TileLayer(
            urlTemplate: 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
            additionalOptions: {
                  'accessToken': 'pk.eyJ1Ijoic3RlZmFudXNhIiwiYSI6ImNscTQ1amF3bDAzZG4ybG14dnhxam1iaGMifQ.FBjIqmEYJUlqncsYhq_-4g',
                  'id': 'mapbox/streets-v11', // or your preferred Mapbox style
    },
    ),
          OverlayImageLayer(
            overlayImages: [
              OverlayImage(
                bounds: LatLngBounds(
                  LatLng(25, 30),
                  LatLng(20, 35),
                ),
                imageProvider: NetworkImage('https://wp-data-ukdw.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2017/10/10124012/logo-ukdw.png'),
              ),
            ],
          ),
          OverlayImageLayer(
            overlayImages: [
              OverlayImage(
                bounds: LatLngBounds(
                  LatLng(35, 40),
                  LatLng(50, 55),
                ),
                imageProvider: NetworkImage('https://wp-data-ukdw.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2017/10/10124012/logo-ukdw.png'),
              ),
            ],
          ),


        ],

    )
    ],

    ));
  }
}
