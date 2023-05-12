import 'package:cat_facts/cubit/cat_fact_cubit.dart';
import 'package:cat_facts/data/cat_fact_repository.dart';
import 'package:cat_facts/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatFactCubit>(
      create: (context) =>
      CatFactCubit(CatFactRepository.instance)..fetchRandomFact(),
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
