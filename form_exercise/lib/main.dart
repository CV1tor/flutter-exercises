import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio 02',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

@override
class _MyHomePageState extends State<MyHomePage> {
  List<String> states = ['State', 'RN', 'RJ', 'SP'];
  String? selectedState = 'State';

  List<String> countries = ['Country', 'Brazil', 'EUA', 'Japan'];
  String? selectedCountry = 'Country';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back), onPressed: () => {}),
          title: const Text("Application"),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) =>
                    [const PopupMenuItem(child: Text("Options"))])
          ],
        ),
        body: SingleChildScrollView(physics: BouncingScrollPhysics(), child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    "Personal Info",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.5,
                  )),
              Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                      decoration:
                          const InputDecoration(hintText: "First Name"))),
              Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Last Name"))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(padding: EdgeInsets.only(bottom: 5), child: TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Birthday"),
                        )),
                        const Text(
                          "MM/DD/YYY",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(bottom: 5), child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Social Security"),
                        )),
                        const Text(
                          "### - ## - ###",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                  child: Text(
                    "Residence address",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.5,
                  )),
              Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                      decoration: const InputDecoration(hintText: "Address"))),
              Padding(padding: EdgeInsets.only(bottom: 10), child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: "City"),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: DropdownButtonFormField<String>(
                        value: selectedState,
                        items: states.map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item)
                        )).toList(),
                        onChanged: (item) => setState(() => selectedState = item),
                      )),
                ],
              )),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: "ZIP Code"),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: DropdownButtonFormField<String>(
                        value: selectedCountry,
                        items: countries.map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item)
                        )).toList(),
                        onChanged: (item) => setState(() => selectedCountry = item),
                      )),
                ],
              )
            ],
          ),
        )));
  }
}
