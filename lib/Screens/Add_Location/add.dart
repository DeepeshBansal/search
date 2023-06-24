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
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ElevatedButton(
        child: const Text('Location Screen'),
        onPressed: () {
          Navigator.pushNamed(context, '/addlocation');
        },
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          'ADD YOUR LOCATION',
          style: TextStyle(color: Colors.black),
        ),
      ),


      body:
      

       Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          const SizedBox(
            height: 90,
          ),
          InputDecorator(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 63, 63, 63), width: 4),
                borderRadius: BorderRadius.circular(20),
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black87, width: 3),
                  borderRadius: BorderRadius.circular(20.0)),
              contentPadding: const EdgeInsets.all(16),
              filled: true,
              fillColor: Colors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                iconEnabledColor: Color.fromARGB(254, 0, 0, 0),
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
                  // This is the widget that will be shown when you select an item.
                  // Here custom text style, alignment and layout size can be applied
                  // to selected item string.
                  return options.map((String value) {
                    return Align(
                      alignment: Alignment(-0.9, 0.0),
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
                items: options.map<DropdownMenuItem<String>>((String value) {
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
          Submit_Button(dropdownValue: dropdownValue),
        ]),
      ),
    );
  }
}

class Submit_Button extends StatelessWidget {
  const Submit_Button({
    super.key,
    required this.dropdownValue,
  });

  final String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 65.0, vertical: 250),
      child: SizedBox(
        height: 70,
        width: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              side: BorderSide(
                  color: Color.fromARGB(255, 223, 109, 109), width: 5),
              backgroundColor: Colors.deepOrange,
              textStyle: const TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w700),
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
              style: TextStyle(
                color: Colors.white),
            )),
      ),
    );
  }
}
