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
  List dropDownListData = [
    {"title": "VSB", "value": "1"},
    {"title": "CVR", "value": "2"},
    {"title": "APJ", "value": "3"},
    {"title": "HJB", "value": "4"},
    {"title": "JC BOSE", "value": "5"},
    {"title": "KSHIPRA", "value": "6"},
    {"title": "NARMADA", "value": "7"},
    {"title": "VIDHYANCHAL", "value": "8"},
    {"title": "LRC", "value": "9"},
    {"title": "LHC", "value": "10"},
    {"title": "ABHINANDAN BHAVAN", "value": "11"},
    {"title": "HEALTH CENTER", "value": "12"},
    {"title": "GATE NO. 1", "value": "13"},
    {"title": "GATE NO. 2", "value": "14"},
    {"title": "SPORTS COMPLEX", "value": "15"},
    {"title": "CITC", "value": "16"},
    {"title": "DIRECTOR BUNGLOW", "value": "17"},
    {"title": "BAL HANUMAN MANDIR", "value": "18"},
    {"title": "CENTRAL DINING", "value": "19"},
    {"title": "BADMINTON COURT", "value": "21"},
    {"title": "WORKSHOP", "value": "22"},
    {"title": "SCHOOL", "value": "20"},
    {"title": "SCHOOL", "value": "20"},
    {"title": "SCHOOL", "value": "20"},
    {"title": "SCHOOL", "value": "20"},
    {"title": "SCHOOL", "value": "20"},
  ];

  String defaultValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ADD YOUR ADDRESS LOCATION"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: ListView(children: [
          const SizedBox(
            height: 20,
          ),
          InputDecorator(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(20.0)),
              contentPadding: const EdgeInsets.all(16),
              filled: true,
              fillColor: Colors.blueAccent,
              
            ),
            
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  isDense: true,
                  value: defaultValue,
                  isExpanded: true,
                  menuMaxHeight: 350,
                  items: [
                    const DropdownMenuItem(
                        value: "",
                        child: Text(
                          "Choose Your Location",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        )),
                    ...dropDownListData.map<DropdownMenuItem<String>>((data) {
                      return DropdownMenuItem(
                          value: data['value'], child: Text(data['title']));
                    }).toList(),
                  ],
                  onChanged: (value) {
                    print("selected Value $value");
                    setState(() {
                      defaultValue = value!;
                    });
                  }),
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal:50),
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            side:
                BorderSide(color: Color.fromARGB(255, 255, 129, 45), width: 5),
            backgroundColor: Color.fromARGB(255, 255, 102, 1),
            textStyle:
                const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          onPressed: () {
            if (defaultValue == "") {
              print("Please select a location");
            } else {
              print("user selected location :  $defaultValue");
            }
          },
          child: const Text(
            'Submit',
            style: TextStyle(color: Colors.white),
          )),
          )
        ]),
      ),
    );
  }
}