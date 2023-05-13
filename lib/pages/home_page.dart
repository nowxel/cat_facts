import 'package:cat_facts/cubit/cat_fact_cubit.dart';
import 'package:cat_facts/pages/fact_history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _items = [];
    final _factsList = Hive.box("catFact");

    void _refreshItems() {
      final data = _factsList.keys.map((key) {
        final item = _factsList.get(key);
        return {
          "key": key,
          "fact": item["fact"],
          "createdAt": item["createdAt"],
        };
      }).toList();
      _items = data.reversed.toList();
      print(_items.length);
    }

    Future<void> _createFact(Map<String, dynamic> newFact) async {
      await _factsList.add(newFact);
      _refreshItems();
    }

    return BlocBuilder<CatFactCubit, CatFactState>(builder: (context, state) {
      final cubit = context.read<CatFactCubit>();
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  _createFact({
                    "fact": state.cat.fact,
                    "createdAt": DateTime.now(),
                  });
                  // box.put(
                  //     'catFact', FactHistory(state.cat.fact, DateTime.now()));

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FactHistoryPage(
                              items: _items,
                            )),
                  );
                },
                icon: const Icon(Icons.history))
          ],
        ),
        body: Stack(
          children: [
            Center(
                child: state.loading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : ListView(
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: cubit.image == null
                                ? Container()
                                : Image.memory(cubit.image!, height: 500),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 0),
                            child: Text(
                              state.cat.fact,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 88),
                        ],
                      )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: const Size(double.infinity, 50),
                          shape: const StadiumBorder()),
                      onPressed: () {
                        _createFact({
                          "fact": state.cat.fact,
                          "createdAt": DateTime.now(),
                        });
                        context.read<CatFactCubit>().fetchRandomFact();
                      },
                      child: const Text("Another fact!"))),
            )
          ],
        ),
      );
    });
  }
}
