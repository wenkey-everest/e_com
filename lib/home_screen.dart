import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({required this.title, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController editingController = TextEditingController();
  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = List<String>.empty(growable: true);

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  items = duplicateItems
                      .where((string) =>
                          string.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
                if (items.isEmpty) {
                  setState(() {
                    items.add("No results found");
                  });
                }
              },
              decoration: const InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
              controller: editingController,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                prototypeItem: ListTile(title: Text(items.first)),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index]}'),
                    subtitle: const Text('This is a subtitle'),
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage("..."),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
