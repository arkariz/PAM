import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Slider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _hue = 360.0;
  double _saturation = 0.5;
  double _lightness = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tugas State Management"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Image.asset(
                      "images/fotodiri.png",
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Muhammad Rizky"), Text("182102025")],
                    ),
                  ),
                ],
              ),
              Container(
                color: HSLColor.fromAHSL(1.0, _hue, _saturation, _lightness)
                    .toColor(),
                height: 300,
                width: MediaQuery.of(context).copyWith().size.width,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 65,
                    margin: EdgeInsets.all(10),
                    child: Text("Hue"),
                  ),
                  Container(
                    width: 270,
                    child: Slider.adaptive(
                      value: _hue,
                      min: 0.0,
                      max: 360.0,
                      label: "$_hue",
                      onChanged: (newHue) {
                        setState(() => _hue = newHue);
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 65,
                    margin: EdgeInsets.all(10),
                    child: Text("Saturation"),
                  ),
                  Container(
                    width: 270,
                    child: Slider.adaptive(
                      value: _saturation,
                      min: 0.0,
                      max: 1.0,
                      label: "$_saturation",
                      onChanged: (newSaturation) {
                        setState(() => _saturation = newSaturation);
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 65,
                    margin: EdgeInsets.all(10),
                    child: Text("Lightness"),
                  ),
                  Container(
                    width: 270,
                    child: Slider.adaptive(
                      value: _lightness,
                      min: 0.0,
                      max: 1.0,
                      label: "$_lightness",
                      onChanged: (newSaturation) {
                        setState(() => _lightness = newSaturation);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

// class Myslider extends StatefulWidget {
//   double hslItem;
//   double maxValue;
//   String label;

//   Myslider(this.hslItem, this.label, this.maxValue);

//   @override
//   _MysliderState createState() => _MysliderState();
// }

// class _MysliderState extends State<Myslider> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("${widget.label}"),
//           Container(
//             child: Slider.adaptive(
//               value: widget.hslItem,
//               min: 0.0,
//               max: widget.maxValue,
//               label: "${widget.hslItem}",
//               onChanged: (newValue) {
//                 setState(() => widget.hslItem = newValue);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
