import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(InfoPage(
    item: 2, name: '', description: '', transportB: '', transportC: '', distance: 0, info: '', time: '',
  ));
}

// ignore: must_be_immutable
class InfoPage extends StatelessWidget {
  //final firestore=FirebaseFirestore.instance;
  //Variables
  int item,distance;
  String name=" ";
  String description=" ";
  String transportB="";
  String transportC=" ";
  String time="";
  String info="";

  InfoPage({super.key, required this.item,required this.name,required this.description,
    required this.transportB,required this.transportC,required this.distance,required this.info,required this.time});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Bilgi Sayfası',
            style: TextStyle(fontFamily: 'Noto Serif Vithkuqi'),
          ),
          backgroundColor: const Color(0xFF8C0A03),
        ),
        body: Center(
          child: Column(
            children: [
              Card(
                color: Colors.white,
                margin: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Image(image: AssetImage('img/yer_$item.jpg')),
                     Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ListTile(
                          title: SelectableText('$name'),
                          subtitle: SelectableText('$description'),
                        ))],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200,40)
                ),
                  onPressed: () {
                  showModalBottomSheet(context: context, builder: (BuildContext context){
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListTile(leading: Icon(Icons.room_outlined,color: Colors.lightGreen,), title: Text('Ortahisar - $name'),subtitle: SelectableText('arası $distance km'),),
                            ListTile(leading: Icon(Icons.directions_bus_outlined,color: Colors.blue),title: Text('Belediye Otobüsü'),subtitle:SelectableText("$transportB") ),
                            ListTile(leading: Icon(Icons.directions_car_outlined, color: Colors.orange,),title: Text('Dolmuş'),subtitle: SelectableText('$transportC'),),
                            ListTile(leading: Icon(Icons.access_time_outlined,color: Colors.red,),title: Text('Ziyaret Saatleri'),subtitle: SelectableText('$time'),),
                            ListTile(leading:Icon(Icons.info_outlined, color: Colors.amberAccent,) ,title: Text("Ek Bilgi"), subtitle: SelectableText('$info'),),
                            ElevatedButton(
                              onPressed: (){
                              Navigator.pop(context);
                            }, child: Text('Kapat'))
                          ],
                        ),
                      ),
                    );
                  }
                  );
                  },
                  child: const Text("Nasıl Giderim?"))
            ],
          ),
        ),
      ),
    );
  }
}

