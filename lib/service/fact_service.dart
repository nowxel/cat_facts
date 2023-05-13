import 'package:cat_facts/model/fact_history.dart';
import 'package:hive/hive.dart';

class FactService {
  late Box<FactHistory> _facts;

  Future<void> init() async {
    Hive.registerAdapter(FactHistoryAdapter());
    _facts = await Hive.openBox<FactHistory>("facts");

    await _facts.clear();

    await _facts.add(FactHistory("fact", DateTime.now()));
  }

  List<FactHistory> getFacts() {
    final facts = _facts.values.toList();
    return facts;
  }

  void addFact(final String fact) {
    _facts.add(FactHistory(fact, DateTime.now()));
  }
}
