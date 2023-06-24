import 'dart:ffi';

import 'package:flutter/material.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({Key? key}) : super(key: key);

  static const String routeName = '/addlocation';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const AddLocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  List<String> options = <String>[
    'Choose Your Location',
    'VSB Hostel',
    'APJ Hostel',
    'CVR Hostel',
    'Devi Ahilya Hostel',
    'JC Bose Hostel',
    'HJ Bhabha Hostel',
    'Central Dining Facility',
    'POD Building',
    'Vidhyanchal Guest House',
    'Health Centre',
    'LRC-Swadyaya',
    'Abhinandan Bhavan',
    'Sports Complex',
    'Bal Hanuman Mandir',
    'La Fresco',
    'Lecture Hall Complex',
    'Narmada Housing',
    'Kshipra Housing',
    'Director Bunglow',
    'CITC Hub Building',
    'Central Workshop',
    'Central HVAC Plant',
    'Gate No. 1',
    'Gate No. 2',
    'Badminton Court',
    'Basketball Court',
    'Tennis Court',
    'Kendriya Vidhyalaya',
  ];
  String defaultValue = "";
  String dropdownValue = 'Choose Your Location';

  static const String routeName = '/addlocation';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const AddLocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: false,
        title: const Text(
          'ADD YOUR LOCATION',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Container(
              padding: const EdgeInsets.only(top: 30),
              child: const MapsButton()),
          Padding(
            padding: const EdgeInsets.only(top: 195),
            child: const Divider(color: Color(0xFF000000), thickness: 1),
          ),
          Padding(
            padding: EdgeInsets.only(top: 127 + 45, left: 166),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromRGBO(255, 255, 255, 1),
                border: Border.all(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  width: 1,
                ),
              ),
              child: Align(
                alignment: const Alignment(0.0, -0.6),
                child: Text(
                  'OR',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 2),
                ),
              ),
            ),
          ),
          ListView(
              padding: const EdgeInsets.only(top: 300, left: 30, right: 30),
              children: [
                InputDecorator(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 63, 63, 63), width: 4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black87, width: 3),
                        borderRadius: BorderRadius.circular(20.0)),
                    contentPadding: const EdgeInsets.all(16),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconEnabledColor: const Color.fromARGB(254, 0, 0, 0),
                      iconSize: 30.0,
                      isDense: true,
                      isExpanded: true,
                      menuMaxHeight: 350,
                      value: dropdownValue,
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      style: const TextStyle(
                          fontFamily: 'Dropdown', color: Colors.black),
                      selectedItemBuilder: (BuildContext context) {
                        return options.map((String value) {
                          return Align(
                            alignment: const Alignment(-0.9, 0.0),
                            child: Text(
                              dropdownValue,
                              style: const TextStyle(
                                  fontFamily: 'Dropdown',
                                  fontSize: 19,
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromARGB(255, 34, 34, 34)),
                            ),
                          );
                        }).toList();
                      },
                      items:
                          options.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                              style: const TextStyle(
                                  fontFamily: 'Dropdown',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                              value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SubmitButton(dropdownValue: dropdownValue),
              ]),
        ],
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.dropdownValue,
  });

  final String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 200,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        height: 70,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              side: const BorderSide(
                  color: Color.fromARGB(255, 255, 129, 45), width: 5),
              backgroundColor: const Color.fromARGB(255, 255, 102, 1),
              textStyle:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              if (dropdownValue == "") {
                print("Please select a location");
              } else {
                print("user selected location :  $dropdownValue");
              }
            },
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}

class MapsButton extends StatelessWidget {
  const MapsButton({
    super.key,
  });

  static const String routeName = '/addlocation';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const AddLocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: 70,
      width: 400,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            side: const BorderSide(
                color: Color.fromARGB(179, 206, 204, 204), width: 3),
            backgroundColor: Colors.white,
            textStyle:
                const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/location');
          },
          child: const Text(
            'Use Google Maps To Add Location',
            style: TextStyle(
                fontFamily: 'Dropdown',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 22, 22, 22)),
          )),
    );
  }
}
