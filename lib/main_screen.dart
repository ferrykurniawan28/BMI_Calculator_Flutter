// import 'package:bmi_calculator/gender.dart';
import 'package:bmi_calculator/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selected = 0;
  double _height = 0;
  int _weight = 80;

  EdgeInsets padding = const EdgeInsets.fromLTRB(0, 20, 0, 20);

  void _increment() {
    setState(() {
      _weight++;
    });
  }

  void _decrement() {
    setState(() {
      _weight--;
    });
  }

  void showError(String errorMessage, List<Widget> action) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error!'),
        content: Text(errorMessage),
        actions: action,
      ),
    );
  }

  Widget customRadio(IconData icon, int index, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _selected = index;
            });
          },
          icon: Icon(
            icon,
            // size: 80,
            color: (_selected == index) ? Colors.blue : Colors.grey,
          ),
          iconSize: 80,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: (_selected == index) ? Colors.blue : Colors.grey,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.blue[100],
            padding: padding,
            child: SizedBox(
              width: 370,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customRadio(Icons.male, 1, 'Male'),
                  customRadio(Icons.female, 2, 'Female'),
                ],
              ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.blue[100],
            padding: padding,
            child: SizedBox(
              width: 370,
              child: Column(
                children: [
                  Text(
                    'Height',
                    style: GoogleFonts.lato(
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${_height.toStringAsFixed(0)} cm',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    ),
                  ),
                  Slider(
                    value: _height,
                    min: 0,
                    max: 300,
                    // divisions: 2,
                    label: _height.toString(),
                    onChanged: (value) {
                      setState(() {
                        _height = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.blue[100],
            padding: padding,
            child: SizedBox(
              width: 370,
              child: Column(
                children: [
                  Text(
                    'Weight',
                    style: GoogleFonts.lato(
                      fontSize: 22,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        onPressed: _decrement,
                        child: const Icon(Icons.remove),
                      ),
                      Text(
                        '$_weight kg',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: _increment,
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            double finalScore = _weight / pow((_height / 100), 2);
            int gender = _selected;

            if (_selected == 0) {
              showError(
                'Choose gender!',
                [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selected = 1;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Male'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selected = 2;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Female'),
                  ),
                ],
              );
            } else if (_height == 0) {
              showError(
                'Choose the right height',
                [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Okay'),
                  ),
                ],
              );
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    finalScore: finalScore,
                    gender: gender,
                  ),
                ),
              );
            }
          },
          child: SizedBox(
            width: 340,
            child: Text(
              'Calculate',
              style: GoogleFonts.lato(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
