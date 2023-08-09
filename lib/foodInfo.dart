import 'package:flutter/material.dart';

void main() {
  runApp(InfoSecondPage(
    item: 0,
    name: '',
    description: '',
    recipe: '',
    restaurant: '',
    address: '',
  ));
}

// ignore: must_be_immutable
class InfoSecondPage extends StatelessWidget {
  int item;
  String name = " ";
  String description = " ";
  String restaurant = " ";
  String recipe = " ";
  String address = " ";

  InfoSecondPage(
      {required this.item,
      required this.name,
      required this.description,
      required this.recipe,
      required this.restaurant,
      required this.address});

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
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: [
              Card(
                color: Colors.white,
                margin: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Image(image: AssetImage('img/yemek_$item.jpg')),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text('$name'),
                        subtitle: Text('$description'),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, fixedSize: Size(200, 40)),
                child: const Text('Nerede yemeliyim?'),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(
                                    Icons.restaurant_outlined,
                                    color: Colors.lightGreen,
                                  ),
                                  title: SelectableText('$restaurant'),
                                  subtitle: SelectableText('$address'),
                                ),
                                /*ListTile(
                                    leading: Icon(Icons.dinner_dining_outlined,
                                        color: Colors.blue),
                                    title: Text('Yemek Tarifi'),
                                    subtitle: SelectableText('$recipe'))*/
                                const ListTile(
                                    leading:
                                        Icon(Icons.info, color: Colors.orange),
                                    title: Text('Ek Bilgi'),
                                    subtitle: SelectableText(
                                        'Daha fazla bilgi için bizevdeyokuz.com adresini ziyaret edebilirsiniz.')),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Kapat'))
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
