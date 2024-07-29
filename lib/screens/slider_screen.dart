import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;

  void changeSlide(double value) {
    _sliderValue = value;
    setState(() {});
  }

  void changeCheckbox(bool? value) {
    _sliderEnabled = value ?? false;
    setState(() {});
  }

  void changeSwitch(bool value) {
    _sliderEnabled = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider && Checks'),
      ),
      body: Column(
        children: [
          Slider.adaptive(
            min: 50,
            max: 400,
            activeColor: AppTheme.primary,
            value: _sliderValue, 
            onChanged: _sliderEnabled ? (value) => changeSlide(value) : null,
          ),
          /*CheckboxListTile.adaptive(
            title: const Text('Habilitar Slider'),
            activeColor: AppTheme.primary,
            value: _sliderEnabled, 
            onChanged: (value) => changeCheckbox(value)
          ),*/
          SwitchListTile.adaptive(
            title: const Text('Habilitar Slider'),
            activeColor: AppTheme.primary,
            value: _sliderEnabled, 
            onChanged: (value) => changeSwitch(value)
          ),
          Image(
            image: const NetworkImage('https://i.pinimg.com/originals/07/49/01/074901a0630fce7358cbf853a26cbdd6.png'),
            fit: BoxFit.contain,
            width: _sliderValue,
          )
        ],
      ),
    );
  }
}