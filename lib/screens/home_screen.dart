import 'package:e_com/data/data_layer.dart';
import 'package:e_com/model/electronics.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({required this.title, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController editingController = TextEditingController();
  late List<Electronics> duplicateItems =
      List<Electronics>.empty(growable: true);
  var items = List<Electronics>.empty(growable: true);

  @override
  void initState() {
    getElectronics().then((value) {
      setState(() {
        items.addAll(value);
        duplicateItems.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    items = duplicateItems;
                  });
                  return;
                }
                setState(() {
                  items = duplicateItems
                      .where((element) => element.title
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                });
              },
              controller: editingController,
              decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Electronics>>(
              future: getElectronics(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  duplicateItems = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(items[index].title),
                        subtitle: Text(items[index].description),
                        leading: Image.network(items[index].images[0],
                            width: 100, height: 100),
                        trailing: Text(items[index].price.toString()),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text("Error");
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
