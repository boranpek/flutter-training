import 'package:flutter/material.dart';
import 'package:lamp/lamp.dart';

class FlashLight extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FlashLightState();

}

class FlashLightState extends State<FlashLight> {
  bool _flashStatus = false;
  bool _isOpen = false;
  double _intensity = 1.0;
  String lamp = "off";
  String button = "Open Light";

  @override
  void initState() {
    super.initState();
    firstState();
  }
  firstState() async {
    bool _flashStatus = await Lamp.hasLamp;
    setState(() {
      this._flashStatus = _flashStatus;
    });
  }

  Future _openLight() async {
    if(_isOpen){
      Lamp.turnOff();
      lamp = "off";
      button = "Open Light";
    }

    else{
      Lamp.turnOn(intensity: _intensity);
      lamp = "on";
      button = "Close Light";
    }
    var hasLamp = await Lamp.hasLamp;
    setState(() {
      _flashStatus = hasLamp;
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flash Light"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/$lamp.jpg"),
            RaisedButton(
              child: Text(button),
              onPressed: _openLight,
            ),
            Slider(
              value: _intensity,
              onChanged: (value){
                if(_isOpen)
                  changeIntensity(value);
              },
            )
          ],
        ),
      ),
    );
  }

  void changeIntensity(double value) {
    Lamp.turnOn(intensity: value);
    setState(() {
      _intensity = value;
    });
  }
}