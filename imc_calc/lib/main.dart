import 'package:flutter/material.dart';
import 'package:imc_calc/model/person.dart';

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
      theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.pinkAccent,
                secondary: Colors.orange,
              )),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _personWeight = TextEditingController();
  final _personHeight = TextEditingController();

  String type = "";
  String imgPath = "assets/placeholder.png";

  Person _newPerson() {
    Person newPerson = Person(
        weight: double.parse(_personWeight.text),
        height: double.parse(_personHeight.text));

    return newPerson;
  }

  double _calculate() {
    Person person = _newPerson();

    return person.weight / (person.height * person.height);
  }

  _evaluation() {
    if (_calculate() < 18.5) {
      setState(() {
        type = "Under Weight";
        imgPath = "assets/under.png";
      });
    } else if (_calculate() >= 18.5 && _calculate() < 25) {
      setState(() {
        type = "Normal Weight";
        imgPath = "assets/normal.png";
      });
    } else if (_calculate() >= 25 && _calculate() < 30) {
      setState(() {
        type = "Over Weight";
        imgPath = "assets/over.png";
      });
    } else if (_calculate() >= 30 && _calculate() < 35) {
      setState(() {
        type = "Obesity I";
        imgPath = "assets/obesity_1.png";
      });
    } else if (_calculate() >= 35 && _calculate() < 40) {
      setState(() {
        type = "Obesity II";
        imgPath = "assets/obesity_2.png";
      });
    } else {
      setState(() {
        type = "Obesity III";
        imgPath = "assets/obesity_3.png";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.calculate),
          title: const Text("BMI Calculator"),
        ),
        body: SingleChildScrollView(physics: BouncingScrollPhysics(), child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 150,
                      child: TextField(
                        controller: _personHeight,
                        decoration: const InputDecoration(
                            labelText: "Height",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.height_rounded)),
                        keyboardType: TextInputType.number,
                      )),
                  SizedBox(
                      width: 150,
                      child: TextField(
                        controller: _personWeight,
                        decoration: const InputDecoration(
                            labelText: "Weight",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.fitness_center)),
                        keyboardType: TextInputType.number,
                      ))
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                      onPressed: _evaluation, child: const Text("Calculate!"))),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    type,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
                Image(image: AssetImage(imgPath), width: 125,)
            ]))));
  }
}
