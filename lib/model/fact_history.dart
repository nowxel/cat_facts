import 'package:hive/hive.dart';

part 'fact_history.g.dart';

@HiveType(typeId: 1)
class FactHistory{
  @HiveField(0)
  final String fact;
  @HiveField(1)
  final DateTime createdAt;

  FactHistory(this.fact, this.createdAt);
}