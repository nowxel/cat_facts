import 'package:flutter/material.dart';

class FactHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const FactHistoryPage({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final currentItem = items[index];
          return ListTile(
            title: Text(currentItem["fact"]),
            subtitle: Text(currentItem["createdAt"].toString()),
          );
        },
      ),
    );
  }
}
