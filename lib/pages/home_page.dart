import 'package:cat_facts/bloc/cat_fact_bloc.dart';
import 'package:cat_facts/pages/fact_history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FactHistoryPage()),
                );
              },
              icon: const Icon(Icons.history))
        ],
        title: const Text('Cat Facts'),
      ),
      body: BlocBuilder<CatFactBloc, CatFactState>(
        builder: (context, catFact) {
          if (catFact.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Center(child: Text(catFact.cat.fact)),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BlocProvider.of<CatFactBloc>(context).image == null
                      ? Container()
                      : Image.memory(
                          BlocProvider.of<CatFactBloc>(context).image!,
                          height: 500),
                ),
                ElevatedButton(
                  child: const Text('Another fact!'),
                  onPressed: () {
                    BlocProvider.of<CatFactBloc>(context)
                        .add(CatFactEvent.getFact);
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
