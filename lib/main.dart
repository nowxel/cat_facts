import 'package:cat_facts/api/cat_fact_repository.dart';
import 'package:cat_facts/cubit/cat_fact_cubit.dart';
import 'package:cat_facts/model/fact_history.dart';
import 'package:cat_facts/pages/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box box;

Future<void> main() async {
  await Hive.initFlutter();
  box = await Hive.openBox("catFact");
  Hive.registerAdapter(FactHistoryAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatFactCubit>(
      create: (context) => CatFactCubit(
        CatFactRepository.instance,
        CatFactService(Dio()),
      )..fetchRandomFact(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: GoogleFonts.abel().fontFamily,
            scaffoldBackgroundColor: const Color(0xFFffd3b6)),
        home: const HomePage(),
      ),
    );
  }
}
