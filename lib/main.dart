import 'package:cat_facts/api/cat_fact_repository.dart';
import 'package:cat_facts/bloc/cat_fact_bloc.dart';
import 'package:cat_facts/model/fact_history.dart';
import 'package:cat_facts/pages/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  Hive.registerAdapter(FactHistoryAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.abel().fontFamily,
          scaffoldBackgroundColor: const Color(0xFFffd3b6)),
      home: FutureBuilder(
        future: Hive.openBox('catFacts'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.error != null) {
              return Text(snapshot.error.toString());
            } else {
              return BlocProvider(
                create: (context) => CatFactBloc(
                  CatFactRepository.instance,
                  CatFactService(Dio()),
                  Hive.box('catFacts'),
                ),
                child: const HomePage(),
              );
            }
          } else {
            return const Scaffold();
          }
        },
      ),
    );
  }
}
