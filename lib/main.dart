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
  double _hue = 180.0;
  double _saturation = 0.5;
  double _lightness = 0.5;

  void _onChangedHue(newValue) {
    setState(() {
      _hue = newValue;
    });
  }

  void _onChangedSaturation(newValue) {
    setState(() {
      _saturation = newValue;
    });
  }

  void _onChangedLightness(newValue) {
    setState(() {
      _lightness = newValue;
    });
  }

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
                  Myslider(_hue, 360.0, _onChangedHue)
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
                  Myslider(_saturation, 1.0, _onChangedSaturation)
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
                  Myslider(_lightness, 1.0, _onChangedLightness)
                ],
              ),
            ],
          ),
        ));
  }
}

class Myslider extends StatelessWidget {
  final double hslItem;
  final double maxValue;
  final onChanged;

  Myslider(this.hslItem, this.maxValue, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Slider.adaptive(
        value: hslItem,
        min: 0.0,
        max: maxValue,
        onChanged: (newValue) {
          onChanged(newValue);
        },
      ),
    );
  }
}
