import 'package:bugun_ne_yesem/foodInfo.dart';
import 'package:bugun_ne_yesem/placeInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: const Text(
            "Trabzon'u Geziyorum",
            style: TextStyle(fontFamily: 'Noto Serif Vithkuqi'),
          ),
        ),
        body: const AnaSayfa(),
      ),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final firestore = FirebaseFirestore.instance;
  int yerNo = 2;
  int yemekNo = 4;
  int infoItem = 0;
  int info2Item = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextButton(
                  child: Card(
                      child: Padding(
                     padding: const EdgeInsets.all(6.0),
                     child: Image.asset('img/yer_$yerNo.jpg'),
                  )),
                  onPressed: () async {
                    CollectionReference placesRef =
                        firestore.collection('Places');
                    var docRef = placesRef.doc('$yerNo');
                    var response = await docRef.get();
                    var map = response.data() as Map;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoPage(
                          item: yerNo,
                          name: map['name'],
                          description: map['description'],
                          transportB: map['transportB'],
                          transportC: map['transportC'],
                          distance:  map['distance'],
                          time: map['time'],
                          info: map['info'],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Divider(indent: 20, endIndent: 20,),
          Expanded(
            flex:4,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextButton(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.asset('img/yemek_$yemekNo.jpg'),
                  ),
                ),
                onPressed: () async {
                  CollectionReference placesRef = firestore.collection('Foods');
                  var docRef = placesRef.doc('$yemekNo');
                  var response = await docRef.get();
                  var map = response.data() as Map;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoSecondPage(
                          item: yemekNo,
                          name: map['name'],
                          description: map['description'],
                          recipe: map['recipe'],
                          restaurant: map['restaurant'],
                          address: map['address'],

                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: Size(200,40)
                  ),
                  onPressed: degistir,
                  child: const Text('Değiştir')),
            ),
          ),
        ],
      ),
    );
  }

  void degistir() {
    setState(() {
      yemekNo = Random().nextInt(6) + 1;
      yerNo = Random().nextInt(7) + 1;
    });
  }
}
