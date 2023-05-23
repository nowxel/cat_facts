import 'package:cat_facts/model/fact_history.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class FactHistoryPage extends StatelessWidget {
  const FactHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fact History'),
      ),
      body: Hive.box('catFacts').isEmpty
          ? Container()
          : ListView.builder(
              itemCount: Hive.box('catFacts').length,
              itemBuilder: (context, index) {
                final catFact = Hive.box('catFacts')
                        .getAt(Hive.box('catFacts').length - 1 - index)
                    as FactHistory;
                final formattedDate =
                    DateFormat('y MMM d hh:mm:ss').format(catFact.createdAt);
                return ListTile(
                  title: Text(catFact.fact),
                  subtitle: Text(formattedDate),
                );
              },
            ),
    );
  }
}
